/*
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
**********************************************************************************
this file contains all functions and declerations needed for setting up phms watch
each functioned is commented on how it functions
**********************************************************************************
<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<*>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
*/

//====================================================================================
// Begin  libraries
//====================================================================================
#include <WiFi.h>
#include <WiFiUdp.h>
#include <Wire.h>
#include <FirebaseESP32.h>
#include "ThingSpeak.h"
#include <HTTPClient.h>
#include <UrlEncode.h>
#include <TimeLib.h>
#include <Timezone.h>
#include <esp_task_wdt.h>                                         // https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/system/misc_system_api.html
//====================================================================================
//                                  Settings
//====================================================================================
#define TIMEZONE euCET // See below for other "Zone references", UK, usMT etc

#ifdef ESP32 // Temporary fix, ESP8266 fails to communicate with some servers...
// Try to use pool url instead so the server IP address is looked up from those available
// (use a pool server in your own country to improve response time and reliability)
const char* ntpServerName = "eg.pool.ntp.org";                                          // I am in Spain, so the Spanish server pool
#else
// Try to use pool url instead so the server IP address is looked up from those available
// (use a pool server in your own country to improve response time and reliability)
const char* ntpServerName = "eg.pool.ntp.org";
#endif

// Try not to use hard-coded IP addresses which might change, you can if you want though...
//IPAddress timeServerIP(129, 6, 15, 30);   // time-c.nist.gov NTP server
//IPAddress timeServerIP(24, 56, 178, 140); // wwv.nist.gov NTP server
IPAddress timeServerIP;                     // Use server pool


// Zone reference "euCET" Central European Time (Frankfurt, Paris)
TimeChangeRule CEST = {"CEST", Last, Sun, Mar, 2, 120};     // Central European Summer Time
TimeChangeRule  CET = {"CET ", Last, Sun, Oct, 3, 60};      // Central European Standard Time
Timezone euCET(CEST, CET);
WiFiUDP udp;// A UDP instance to let us send and receive packets over UDP
//====================================================================================
// Begin Variables
//====================================================================================
TimeChangeRule *tzCode;                                   // Pointer to the time change rule, use to get the TZ abbrev, e.g. "GMT"

time_t utc                            = 0;
time_t local                          = 0;
time_t boottime                       = 0;

bool timeValid = false;
unsigned int localPort                = 2390;             // local port to listen for UDP packets
const int NTP_PACKET_SIZE             = 48;               // NTP time stamp is in the first 48 bytes of the message
byte packetBuffer[ NTP_PACKET_SIZE ];                     //buffer to hold incoming and outgoing packets

uint8_t lastMinute                    = 0;
uint32_t nextSendTime                 = 0;
uint32_t newRecvTime                  = 0;
uint32_t lastRecvTime                 = 0;
uint32_t newTickTime                  = 0;
uint32_t lastTickTime                 = 0;
bool ntp_start                        = true;
uint32_t no_packet_count              = 0;

unsigned int WiFiRefresh        = 0;                  // Added in V2.04 to check and refresh WiFi connection when neccesary and show the result
int WiFiToUse                   = 99;                 // Added in V2.14 to autoselect free network
boolean WiFiSpecified           = false;
boolean ForceForget             = false;


const char WIFI_SSID[MAX_SSID_LEN]      = "omar";  // Specify WIFI_SSID if using a encrypted 2.4GHz only! WiFI network
const char WIFI_PASSWORD[MAX_SSID_LEN]  = "omar50090";    // Specify WIFI_SSID_PASSWORD if using a encrypted WiFI network
char WIFI_SSID_FOUND[MAX_SSID_LEN]= "";                           // SSID to be used to connect if NOT defined or able to connect to an encrypted network, it will search for an open network without a password.

const char* THINGSPEAK_SERVER = "api.thingspeak.com";
const unsigned int THINGSPEAK_CHANNEL_ID = 2058642;
const char* THINGSPEAK_API_KEY = "GRG70UU43JQ4CCHA";
const char* FIREBASE_HOST = "https://portable-monitoring-syst-caeb8-default-rtdb.firebaseio.com/";
const char* FIREBASE_AUTH_KEY = "AIzaSyDQ65OCq3Pp6pUVZmn03ZM1M0ZUz2DEGRY";

// +international_country_code + phone number
//String phoneNumber = "201155322427";
//String apiKey = "5204452";


// Replace with your Telegram Bot Token (sent by BotFather)
const char* botToken = "5918439571:AAFA3B1HIvE3xG0023msdMSk7NWpsndnSc4";

// Replace with your Telegram chat ID
const char* chatId = "715127426";



#define WDT_TIMEOUT   10                                          // define a 10 seconds WDT (Watch Dog Timer)
esp_reset_reason_t reason = esp_reset_reason();                   // Find the reason for this reboot, ESP_RST_POWERON is normal, ESP_RST_TASK_WDT is the one I expect to see sometimes because of hang in the renderface() routine
   
//====================================================================================
// End Variables
//====================================================================================




//====================================================================================
// Begin sendNTPpacket() Send an NTP request to the time server at the given address
//====================================================================================
void sendNTPpacket(IPAddress& address) {                // Serial.println("sending NTP packet...");
    memset(packetBuffer, 0, NTP_PACKET_SIZE);           // set all bytes in the buffer to 0
                                                        // Initialize values needed to form NTP request
                                                        // (see URL above for details on the packets)
    packetBuffer[0] = 0b11100011;                       // LI, Version, Mode
    packetBuffer[1] = 0;                                // Stratum, or type of clock
    packetBuffer[2] = 6;                                // Polling Interval
    packetBuffer[3] = 0xEC;                             // Peer Clock Precision
                                                        // 8 bytes of zero for Root Delay & Root Dispersion
    packetBuffer[12]  = 49;
    packetBuffer[13]  = 0x4E;
    packetBuffer[14]  = 49;
    packetBuffer[15]  = 52;
                                                        // all NTP fields have been given values, now
                                                        // you can send a packet requesting a timestamp:
    udp.beginPacket(address, 123);                      // NTP requests are to port 123
    udp.write(packetBuffer, NTP_PACKET_SIZE);
    udp.endPacket();
}
//====================================================================================
// End sendNTPpacket() Send an NTP request to the time server at the given address
//====================================================================================




//====================================================================================
// Begin decodeNTP() Decode the NTP message and print status to serial port
//====================================================================================
void decodeNTP(void) {
    timeValid = false;
    uint32_t waitTime = millis() + 500;
    while (millis() < waitTime && !timeValid){
        yield();
        if (udp.parsePacket()) {
              newRecvTime = millis();                   // We've received a packet, read the data from it
              udp.read(packetBuffer, NTP_PACKET_SIZE);  // read the packet into the buffer
              Serial.print("\nNTP response time was : ");
              Serial.print(500 - (waitTime - newRecvTime));
              Serial.println(" ms");
              Serial.print("Time since last sync is: ");
              Serial.print((newRecvTime - lastRecvTime) / 1000.0);
              Serial.println(" s");
              lastRecvTime = newRecvTime;
      unsigned long highWord = word(packetBuffer[40], packetBuffer[41]);  // The timestamp starts at byte 40 of the received packet and is four bytes,
      unsigned long lowWord = word(packetBuffer[42], packetBuffer[43]);   // or two words, long. First, extract the two words:
                                                                          // Combine the four bytes (two words) into a long integer
      unsigned long secsSince1900 = highWord << 16 | lowWord;             // this is NTP time (seconds since Jan 1 1900):

      utc = secsSince1900 - 2208988800UL;                                 // Now convert NTP Unix time (Seconds since Jan 1 1900) into everyday time:
                                                                          // UTC time starts on Jan 1 1970. In seconds the difference is 2208988800:
        
      setTime(utc);                                                       // Set system clock to utc time (not time zone compensated)
      local = euCET.toLocal(utc, &tzCode);                                // convert utc into local timezone compensated
      setTime(local);                                                     // Set system clock to local time (this IS time zone compensated)
           
      timeValid = true;

      // Print the hour, minute and second:
      Serial.print("Received NTP UTC time plus local correction is: ");

      uint8_t hh = hour(local);                                           // uint8_t hh = hour(utc);
      Serial.print(hh);                                                   // print the hour (86400 equals secs per day)

      Serial.print(':');
      uint8_t mm = minute(local);                                         // uint8_t mm = minute(utc);
      if (mm < 10 ) Serial.print('0');
      Serial.print(mm);                                                   // print the minute (3600 equals secs per minute)
      Serial.print(':');
      uint8_t ss = second(local);                                         // uint8_t ss = second(utc); 
      if ( ss < 10 ) Serial.print('0');
      Serial.println(ss);                                                 // print the second
    }
  }

      if ( timeValid ) {                                                  // Keep a count of missing or bad NTP replies
          no_packet_count = 0;
      }
      else
      {
      Serial.println("\nNo NTP reply, trying again in 1 minute...");
      no_packet_count++;
      }

      if  (no_packet_count >= 10) {                                       // 10 minutes with no NTP update, force network change
            if ( WiFiSpecified == true ) ForceForget = true;              // force to no longer use specified network, look for open network from now on
            no_packet_count = 0;                                          // Reset no_packet_count
            nextSendTime = millis();                                      // After the next re-connect, make sure to get a new NTP time again quickly
            WiFiToUse = 99;                                               // Added to force look for new free WiFi network
            memset(WIFI_SSID_FOUND, 0, MAX_SSID_LEN);                     // clear the WIFI_SSID
            esp_task_wdt_deinit();                                        // no NTP, so probably a network issue, therefor temporarily disable the watchdog, so there is time to find a new network
            Serial.println("");
            Serial.println("No NTP packet in last 10 minutes, watchdog disabled, forced network change");
      }
}
//====================================================================================
// Begin decodeNTP() Decode the NTP message and print status to serial port
//====================================================================================




//====================================================================================
// Begin timeString()                                 Time string: 00:00:00
//====================================================================================
String timeString(uint32_t t_secs) {
    String timeNow = "";

    uint8_t h = t_secs / 3600;
    if ( h < 10) timeNow += "0";
    timeNow += h;

    timeNow += ":";
    uint8_t m = (t_secs - ( h * 3600 )) / 60;
    if (m < 10) timeNow += "0";
    timeNow += m;

    timeNow += ":";
    uint8_t s = t_secs - ( h * 3600 ) - ( m * 60 );
    if (s < 10) timeNow += "0";
    timeNow += s;

    return timeNow;
}
//====================================================================================
// End timeString()                                 Time string: 00:00:00
//====================================================================================


//====================================================================================
// Begin sendMessage()  send a message through whatsapp 
//====================================================================================
void sendMessage(String message){

  // Data to send with HTTP POST
  String url = "https://api.callmebot.com/whatsapp.php?phone=" + phoneNumber + "&apikey=" + apiKey + "&text=" + urlEncode(message);    

  HTTPClient http;
  http.begin(url);

  // Specify content-type header
  http.addHeader("Content-Type", "application/x-www-form-urlencoded");
  
  // Send HTTP POST request
  int httpResponseCode = http.POST(url);
  if (httpResponseCode == 200){
    Serial.println("Message sent successfully");
  }
  else{
    Serial.println("Error sending the message");
    Serial.println("HTTP response code: ");
    Serial.println(httpResponseCode);
  }

  // Free resources
  http.end();
  }
//====================================================================================
// end sendMessage() 
//====================================================================================



//====================================================================================
// Begin connectToNetwork() connect to network 
//====================================================================================
void connectToNetwork() {
  Serial.print("Connecting to Wi-Fi...");
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("Connected to network");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}

//====================================================================================
// end connectToNetwork() 
//====================================================================================



//====================================================================================
// Begin syncTime() Update Time
//====================================================================================
void syncTime(void) {
              WiFi.begin(WIFI_SSID, WIFI_PASSWORD);               // use specified network       
              Serial.print("Connecting to specified network: ");
              Serial.println(WIFI_SSID);                
              

      uint32_t WaitForConnectionTime = millis() + 10000;
      while (WiFi.status() != WL_CONNECTED) {           
            Serial.print(".");
                  if ( ForceForget == true || WiFiSpecified == false ) {
                        if (WiFi.status() != WL_CONNECTED) WiFi.begin(WIFI_SSID_FOUND);           // connect to the found, open network
                  }
                  else
                  {
                        if (WiFi.status() != WL_CONNECTED) WiFi.begin(WIFI_SSID, WIFI_PASSWORD);  // connect to the specified, secure network
                        if ( WaitForConnectionTime < millis() ) break;
                  }
      delay(500);
      }
    
    Serial.println("");
    if ( (WiFi.status() != WL_CONNECTED) && ( ForceForget == false || WiFiSpecified == true ) ) { // if this fails, switch to look for an open network
          Serial.println("Unable to connect to specified network, check your WiFI name and Password");
          Serial.println("Looking for an open network now... (See TFT for info)");
          ForceForget = true;
          ntp_start = true;
          WiFi.disconnect();
          }
                                  
      Serial.println();
      udp.begin(localPort); 
      if (WiFi.status() == WL_CONNECTED) {ntp_start = false;}
  

  if ( WiFi.status() == WL_CONNECTED ) {
    
    if (nextSendTime < millis()) {                                        // Don't send too often so we don't trigger Denial of Service

      WiFiClient client;                                                // Added to check if the WiFi is still connected
      if (!client.connect("api.ipify.org", 80)) {                       // This is a site that can be used to get your Publlic IP, not used now, just to check the connection..
            Serial.println("Failed to connect with 'api.ipify.org' !");
            WiFi.disconnect();
            Serial.println("Trying to reconnect!");
            WiFi.reconnect();
            WiFiRefresh = WiFiRefresh + 1;                              // variable used to indicate a refresh was (once or more times) necesary, shown on cockface
            while (WiFi.status() != WL_CONNECTED) {
                  Serial.print('.');
                  delay(500);
            }
      nextSendTime = millis();                                          // After this re-connect, make sure to get a new NTP time again quickly
      }
        
      nextSendTime = millis() + ( 60 * 60 * 1000 );                     // Wait 1 hour for next sync
      WiFi.hostByName(ntpServerName, timeServerIP);                     // Get a random server from the pool
      sendNTPpacket(timeServerIP);                                      // send an NTP packet to a time server
      decodeNTP();

      if ( no_packet_count > 0 )  {                                     // Wait 1 minute for next sync
            nextSendTime = millis() + ( 60 * 1000 );
      }
      else 
      {
      nextSendTime = millis() + ( 60 * 60 * 1000 );                     // Wait 1 hour for next sync
      }
    }
  }
}
//====================================================================================
// End syncTime() Update Time
//====================================================================================




