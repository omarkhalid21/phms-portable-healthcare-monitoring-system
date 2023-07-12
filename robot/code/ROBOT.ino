#include "DHT.h"
#include <WiFi.h>
#include <WiFiClientSecure.h>
#include <UniversalTelegramBot.h>
#include <ArduinoJson.h>
#include <Wire.h>
#include <FirebaseESP32.h>
#include <HTTPClient.h>
#include <UrlEncode.h>
#include "ThingSpeak.h"

#define DHTPIN 4     // Digital pin connected to the DHT sensor
// Feather HUZZAH ESP8266 note: use pins 3, 4, 5, 12, 13 or 14 --
// Pin 15 can work but DHT must be disconnected during program upload.
#define DHTTYPE DHT11 

// Replace with your network credentials
const char* ssid = "????????????? ";
const char* password = "????????????? ";
const char* THINGSPEAK_SERVER = "api.thingspeak.com";
const unsigned int THINGSPEAK_CHANNEL_ID = ??????;
const char* THINGSPEAK_API_KEY = "????????";
const char* FIREBASE_HOST = "???????????????";
const char* FIREBASE_AUTH_KEY = "?????????????";

const int trigPin = 5;
const int echoPin = 18;

//define sound speed in cm/uS
#define SOUND_SPEED 0.034
#define CM_TO_INCH 0.393701

long duration;
float distanceCm;
float distanceInch;

// Initialize Telegram BOT
#define BOTtoken "???????????????????????????????????"  // your Bot Token (Get from Botfather)
// Use @myidbot to find out the chat ID of an individual or a group
#define CHAT_ID "??????????"

WiFiClientSecure client;
UniversalTelegramBot bot(BOTtoken, client);
FirebaseData firebaseData;
WiFiClient client2;

// +international_country_code + phone number
String phoneNumber = "??????????????";
String apiKey = "????";


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


DHT dht(DHTPIN, DHTTYPE);


void setup() {
  Serial.begin(115200);
  // Attempt to connect to Wifi network:
  Serial.print("Connecting Wifi: ");
  Serial.println(ssid);

  WiFi.mode(WIFI_STA);
  WiFi.begin(ssid, password);
  client.setCACert(TELEGRAM_CERTIFICATE_ROOT); // Add root certificate for api.telegram.org
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH_KEY);

  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input

  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(50);
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  Serial.println(F("DHTxx test!"));

  dht.begin();

  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH_KEY);
  ThingSpeak.begin(client2);
}


void loop() {
        // vital signs data note: not for gate to check how to get value because we testing with genrateing values
 // float bodyTemperature = random(339, 380) / 10.0;
 // float oxygenPercentage = random(950, 991) / 10.0;
 // float heartRate = random(67, 90);
//  float beatsPerMinute = random(50, 120);
  //float beatsPerMinute = random(150, 200);
 // float latitude = random(30035403, 30035404) / 1000000.0;      //   30.035404     //  30135038, 30135048
 // float longitude  = random(31430938,31430939) / 1000000.0;    //   31.430939     //  31366616, 31366626
//  float Temp_room  = random(251,289 ) / 10.0;
//  float Humidity  = random(30, 60);

  // Reading temperature or humidity takes about 250 milliseconds!
  // Sensor readings may also be up to 2 seconds 'old' (its a very slow sensor)
  float Humidity = dht.readHumidity();
  // Read temperature as Celsius (the default)
  float temperature_Celsius = dht.readTemperature();
  // Read temperature as Fahrenheit (isFahrenheit = true)
  float temp = dht.readTemperature(true);

  // Check if any reads failed and exit early (to try again).
  if (isnan(Humidity) || isnan(temperature_Celsius) || isnan(temp)) {
  /*  Serial.println(F("Failed to read from DHT sensor!"));
    return;*/
  }

  // Compute heat index in Fahrenheit (the default)
  float hif = dht.computeHeatIndex(temp, Humidity);
  // Compute heat index in Celsius (isFahreheit = false)
  float hic = dht.computeHeatIndex(temperature_Celsius, Humidity, false);

  Serial.print(F("Humidity: "));
  Serial.print(Humidity);
  Serial.print(F("%  Room Temperature: "));
  Serial.print(temperature_Celsius);
  Serial.print(F("°C "));
  Serial.print(temp);
  Serial.print(F("°F  Heat index: "));
  Serial.print(hic);
  Serial.print(F("°C "));
  Serial.print(hif);
  Serial.println(F("°F"));
  // Prints the distance in the Serial Monitor
  Serial.print("Distance (cm): ");
  Serial.println(distanceCm);
  Serial.print("Distance (inch): ");
  Serial.println(distanceInch);
  Serial.print("latitude = ");
  Serial.println(latitude);
  Serial.print("longitude = ");
  Serial.println(longitude);
  // print vital signs values 
  Serial.print("Oxygen level percentage (%) = ");
  Serial.println(oxygenPercentage);
  Serial.print("body Temperature (ºC) = ");
  Serial.println(bodyTemperature);
  Serial.print("Pulse heart rate (Bpm) = ");
  Serial.println(heartRate);
  Serial.println("---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------");

  // Send data to Firebase
  Firebase.setFloat(firebaseData, "/phms/Wearable/body temperature = ", bodyTemperature);
  Firebase.setFloat(firebaseData, "/phms/Wearable/oxygen level percentage =", oxygenPercentage); 
  Firebase.setFloat(firebaseData, "/phms/Wearable/pulse heart rate = ", heartRate); 
  Firebase.setFloat(firebaseData, "/phms/Wearable/pulse heart rate beat average = ", beatsPerMinute);
  Firebase.setFloat(firebaseData, "/phms/Robot/A distance of nearest body = ", distanceCm);
  Firebase.setFloat(firebaseData, "/phms/Robot/latitude = ", latitude);
  Firebase.setFloat(firebaseData, "/phms/Robot/longitude = ", longitude);
  Firebase.setFloat(firebaseData, "/phms/Robot/Humidity = ", Humidity);
  Firebase.setFloat(firebaseData, "/phms/Robot/temperature_room_Celsius = ", temperature_Celsius);

  // set fields to ThingSpeak
  ThingSpeak.setField(1, heartRate);    
  ThingSpeak.setField(2, oxygenPercentage);
  ThingSpeak.setField(3, bodyTemperature);
  ThingSpeak.setField(4, beatsPerMinute);

  // Send data to ThingSpeak
   // int x = ThingSpeak.writeFields(THINGSPEAK_CHANNEL_ID, THINGSPEAK_API_KEY);
  ThingSpeak.writeFields(THINGSPEAK_CHANNEL_ID, THINGSPEAK_API_KEY);   
      /*
  // check request send data to ThingSpeak
    if(x == 200){ 
      Serial.println("ALL Channels update successful");  }
   else{
      Serial.println("Problem updating ALL Channels HTTP error code " + String(x)); }
    */

 // Clears the trigPin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  
  // Reads the echoPin, returns the sound wave travel time in microseconds
  duration = pulseIn(echoPin, HIGH);
    // Calculate the distance
  distanceCm = duration * SOUND_SPEED/2;
    // Convert to inches
  distanceInch = distanceCm * CM_TO_INCH;
  
  // Check if any of the sensor values exceed the threshold
if (heartRate < 40 || heartRate > 150 || bodyTemperature < 29 || bodyTemperature > 41 || oxygenPercentage < 90  ||  beatsPerMinute < 40 || beatsPerMinute > 150 || distanceCm < 15 || distanceCm > 300) {
    // Send an alert message to the whatsapp bot
         String alertMessage = "ALERT : ";
    if (oxygenPercentage < 90) {
      alertMessage += "Oxygen level is too low (" + String(oxygenPercentage) + ")\n";
     alertMessage += "Distance: " + String(distanceCm) + " cm\n";
     alertMessage += "Latitude: " + String(latitude) + "\n";
     alertMessage += "Longitude: " + String(longitude) + "\n";
     alertMessage += "Humidity: " + String(Humidity) + "\n";
     alertMessage += "Temperature (Room): " + String(temperature_Celsius) + " °C";
    }
    if (bodyTemperature > 41) {
      alertMessage += "Temperature of body is too high (" + String(bodyTemperature) + ")\n";
     alertMessage += "Distance: " + String(distanceCm) + " cm\n";
     alertMessage += "Latitude: " + String(latitude) + "\n";
     alertMessage += "Longitude: " + String(longitude) + "\n";
     alertMessage += "Humidity: " + String(Humidity) + "\n";
     alertMessage += "Temperature (Room): " + String(temperature_Celsius) + " °C";
    }
    if (bodyTemperature < 29) {
      alertMessage += "Temperature of body is too low (" + String(bodyTemperature) + ")\n";
     alertMessage += "Distance: " + String(distanceCm) + " cm\n";
     alertMessage += "Latitude: " + String(latitude) + "\n";
     alertMessage += "Longitude: " + String(longitude) + "\n";
     alertMessage += "Humidity: " + String(Humidity) + "\n";
     alertMessage += "Temperature (Room): " + String(temperature_Celsius) + " °C";
    }
    if (heartRate > 150) {
      alertMessage += "Pulse rate is too high (" + String(heartRate) + ")\n";
     alertMessage += "Distance: " + String(distanceCm) + " cm\n";
     alertMessage += "Latitude: " + String(latitude) + "\n";
     alertMessage += "Longitude: " + String(longitude) + "\n";
     alertMessage += "Humidity: " + String(Humidity) + "\n";
     alertMessage += "Temperature (Room): " + String(temperature_Celsius) + " °C";
    }
    if (heartRate < 40) {
      alertMessage += "Pulse rate is too low (" + String(heartRate) + ")\n";
     alertMessage += "Distance: " + String(distanceCm) + " cm\n";
     alertMessage += "Latitude: " + String(latitude) + "\n";
     alertMessage += "Longitude: " + String(longitude) + "\n";
     alertMessage += "Humidity: " + String(Humidity) + "\n";
     alertMessage += "Temperature (Room): " + String(temperature_Celsius) + " °C";
    }
    if (beatsPerMinute > 150) {
      alertMessage += "beats Per Minute is too high (" + String(beatsPerMinute) + ")\n";
     alertMessage += "Distance: " + String(distanceCm) + " cm\n";
     alertMessage += "Latitude: " + String(latitude) + "\n";
     alertMessage += "Longitude: " + String(longitude) + "\n";
     alertMessage += "Humidity: " + String(Humidity) + "\n";
     alertMessage += "Temperature (Room): " + String(temperature_Celsius) + " °C";
    }
    if (beatsPerMinute < 40) {
      alertMessage += "beats Per Minute is too low (" + String(beatsPerMinute) + ") \n";
     alertMessage += "Distance: " + String(distanceCm) + " cm\n";
     alertMessage += "Latitude: " + String(latitude) + "\n";
     alertMessage += "Longitude: " + String(longitude) + "\n";
     alertMessage += "Humidity: " + String(Humidity) + "\n";
     alertMessage += "Temperature (Room): " + String(temperature_Celsius) + " °C"; 
    }    
    if (distanceCm < 15) {
     alertMessage += "Distance: " + String(distanceCm) + " cm\n";
     alertMessage += "Latitude: " + String(latitude) + "\n";
     alertMessage += "Longitude: " + String(longitude) + "\n";
     alertMessage += "Humidity: " + String(Humidity) + "\n";
     alertMessage += "Temperature (Room): " + String(temperature_Celsius) + " °C";
    }  
    if (distanceCm > 300) {
     alertMessage += "Distance: " + String(distanceCm) + " cm\n";
     alertMessage += "Latitude: " + String(latitude) + "\n";
     alertMessage += "Longitude: " + String(longitude) + "\n";
     alertMessage += "Humidity: " + String(Humidity) + "\n";
     alertMessage += "Temperature (Room): " + String(temperature_Celsius) + " °C";
    }     
     sendMessage(alertMessage);
        bot.sendMessage(CHAT_ID, alertMessage, "");
  } 

}