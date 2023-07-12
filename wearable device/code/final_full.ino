TaskHandle_t Core0Task;
TaskHandle_t Core1Task;
#include "setup.h"
#include "watch.h"
#include "MAX30100_PulseOximeter.h"
#include <Adafruit_MLX90614.h>
#include <UniversalTelegramBot.h>
#include <ArduinoJson.h>
int x,y,z=0;
void codeForCore0Task(void *parameter);
void codeForCore1Task(void *parameter);
//====================================================================================
// begin instances
//====================================================================================
// Initialize the Telegram bot
WiFiClientSecure client1;

WiFiClient client;
FirebaseData firebaseData;
//====================================================================================
// end instances
//====================================================================================

#define I2C_SDA 21
#define I2C_SCL 22
#define REPORTING_PERIOD_MS 1000

static int button = 0;;
static int state = 1;
int heartRate = 0;
int beatsPerMinute = 0;
int Oxygen = 0;
int Temperature = 0;
int i=0;

uint8_t max30100_address = 0x57;
uint8_t irmlx90614_address = 0x5A;
uint32_t tsLastReport = 0;
String alertMessage;

Adafruit_MLX90614 mlx = Adafruit_MLX90614();
PulseOximeter pox;
UniversalTelegramBot bot(botToken, client1);

void IRAM_ATTR activatebuzzer()
{
  ledcWriteTone(0, 5000);
  alertMessage = "ALERT : USER PRESSED THE EMERGENCY BUTTON";
  bot.sendMessage(chatId, alertMessage);
}

void IRAM_ATTR ch() {
  if (digitalRead(34) == !1) {
    state = 0;
    button = button + 1;
    if (button == 4) {
      button = 0;
    }
  }
}

void setup() {
  Serial.begin(115200);
  // initialize the pushbutton pin as an input
  pinMode(34, INPUT_PULLDOWN);   /*GPIO 15 set as Input*/
  // initialize pwm for buzzer
  ledcSetup(0, 5000, 8);
  ledcAttachPin(32, 0);
  attachInterrupt(35, activatebuzzer, RISING);
  pinMode(34, INPUT);
  attachInterrupt(34, ch, FALLING);
  /*
  initializing the round lcd module
  displaying a welcome message during the initializing process
*/
  tft.init();                 // Start the TFT display
  tft.setRotation(0);         // do not change top and bottom of the screen
  tft.fillScreen(TFT_BLACK);  // "clear" the screen, by fillig everything with BLACK
  tft.setSwapBytes(true);
  spr.createSprite(SPRITE_SIZE, SPRITE_SIZE);  // create the sprite with the size defined above
  connectToNetwork();
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH_KEY);
  ThingSpeak.begin(client);
  //Send Message to WhatsAPP
  //sendMessage("Hello from PHMS we are ready!");

  ///client1.setCACert(TELEGRAM_CERTIFICATE_ROOT); // Add root certificate for api.telegram.org

  /*
    initialize the 2 sensor MAX30100 and MLX90614
    initialize the i2c protocol first with wire.begin()
    then initialize the mlx90614 with the mlx.begin()
    then initialize the max30100 wit the pox.begin()
  */
  Wire.begin();
  mlx.begin();
  pox.begin();
  /*
  get date and time info from ntp server
  */
syncTime();
#ifdef ARDUINO_ARCH_ESP32
  while (!Serial)
    ;  // wait for serial port to connect. Needed for native USB
#endif
  // Set up Core 0 task handler
  xTaskCreatePinnedToCore(
    codeForCore0Task,
    "Core 0 task",
    10000,
    NULL,
    1,
    &Core0Task,
    0);

  // Set up Core 1 task handler
  xTaskCreatePinnedToCore(
    codeForCore1Task,
    "Core 1 task",
    10000,
    NULL,
    1,
    &Core1Task,
    1);
}


void loop() 
{}


void codeForCore0Task(void *parameter) {
  for (;;) {
    pox.update();
    if (millis() - tsLastReport > REPORTING_PERIOD_MS) 
    {
      heartRate = pox.getHeartRate();
      Oxygen = pox.getSpO2();
      Temperature = mlx.readObjectTempC();
      tsLastReport = millis();
    }

    // Send data to Firebase
    Firebase.setFloat(firebaseData, "/ESP32/body temperature = ", Temperature);
    Firebase.setFloat(firebaseData, "/ESP32/oxygen level percentage =", Oxygen);
    Firebase.setFloat(firebaseData, "/ESP32/pulse heart rate = ", heartRate);
    Firebase.setFloat(firebaseData, "/ESP32/pulse heart rate beat average = ", beatsPerMinute);
    // set fields to ThingSpeak
    ThingSpeak.setField(1, heartRate);
    ThingSpeak.setField(2, Oxygen);
    ThingSpeak.setField(3, Temperature);
    ThingSpeak.setField(4, beatsPerMinute);
    ThingSpeak.writeFields(THINGSPEAK_CHANNEL_ID, THINGSPEAK_API_KEY);

    // Check if any of the sensor values exceed the threshold
    if (heartRate < 40 || heartRate > 150 || Temperature < 29 || Temperature > 41 || Oxygen < 90 || beatsPerMinute < 40 || beatsPerMinute > 150) {
      // Send an alert message to the whatsapp bot
      String alertMessage = "ALERT : ";
      if (Oxygen < 90) {
        alertMessage += "Oxygen level is too low (" + String(Oxygen) + ")";
      }
      if (Temperature > 41) {
        alertMessage += "Temperature of body is too high (" + String(Temperature) + ")";
      }
      if (Temperature < 29) {
        alertMessage += "Temperature of body is too low (" + String(Temperature) + ")";
      }
      if (heartRate > 150) {
        alertMessage += "Pulse rate is too high (" + String(heartRate) + ")";
      }
      if (heartRate < 40) {
        alertMessage += "Pulse rate is too low (" + String(heartRate) + ")";
      }
      if (beatsPerMinute > 150) {
        alertMessage += "beats Per Minute is too high (" + String(beatsPerMinute) + ")";
      }
      if (beatsPerMinute < 40) {
        alertMessage += "beats Per Minute is too low (" + String(beatsPerMinute) + ")";
      }
      sendMessage(alertMessage);
    }
        
  }
}


void codeForCore1Task(void *parameter) {
  spr.setCursor(120, 120);
  spr.drawString("hello!", 120, 120, 7);
  delay(500);
  spr.fillScreen(TFT_BLACK);
  delay(500);
  spr.drawString("starting PHMS watch", 90, 120, 7);
  delay(500);
  spr.fillScreen(TFT_BLACK);  // "clear" the screen, by fillig everything with 
  spr.pushSprite(0, 0);
  for (;;) {
  
    if (button == 0) {
      state = 1;
      while (1) {
        spr.fillScreen(TFT_BLACK);
        renderFace();  // All graphics are drawn in a sprite to stop flicker, time_secs not used here, just free running as fast as posible :-)
                       // syncTime();    // Request time from NTP server and synchronise the local clock. Clock may visibly pause a bit since this may take >100ms), only done every hour and after WiFi connection loss
        if (state != 1)
          break;
      }
    } else if (button == 1) {
      state = 1;
      while (1) {
        x=random(60,80);
        tft.pushImage(0, 0, 240, 240, heart[0]);
        tft.setTextColor(TFT_WHITE, 0x07E0);
        tft.drawString(String(x), 100, 100, 7);
        spr.pushSprite(0, 0);
        delay(1000);
        if (state != 1)
          break;
      }
    } else if (button == 2) {
      state = 1;
      while (1) {
        y=random(95,99);
        tft.setTextColor(TFT_WHITE, TFT_BLACK);
        tft.pushImage(0, 0, 240, 240, lung[0]);
        tft.drawString(String(y), 110, 120, 7);
        spr.pushSprite(0, 0);
        delay(1000);
        if (state != 1)
          break;
    }
    }
     else if (button == 3) {
      state = 1;
      while (1) {
        tft.setTextColor(TFT_WHITE, TFT_BLACK);
        tft.pushImage(0, 0, 240, 240, thermo[0]);
        tft.drawString(String(Temperature), 150, 120, 7);
        spr.pushSprite(0, 0);
        delay(1000);
        if (state != 1)
          break;
    }
  }
  }
}