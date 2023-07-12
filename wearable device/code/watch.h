char VersionNumber[6] = "V2.20";

#define WIFI_DELAY        500
#define MAX_SSID_LEN      32                                      // Max SSID octets
#define MAX_CONNECT_TIME  30000                                   // Wait this much until device gets IP

#include <Arduino.h>                                              // Arduino stuff
#include <TFT_eSPI.h>                                             // load the stuff for the TFT display
#include <SPI.h>                                                  // Needed for the SPI communication with the display
#include "fonts.h"                                                // Load the fonts from the extra tab in the IDE
// Load header after time_secs global variable has been created so it is in scope
#include "heart.h"
#include "lung.h"
#include "thermo.h"


TFT_eSPI    tft       = TFT_eSPI();                               // create a TFT display
TFT_eSprite spr       = TFT_eSprite(&tft);                        // create a sprite for the TFT display


//Lots of information about the use of the TFT_eSPI library can be found here: https://developpaper.com/introduction-to-color-display-2-color-setting-and-text-display/
// Default color definitions
#define TFT_BLACK       0x0000      //   0,   0,   0 
#define TFT_NAVY        0x000F      //   0,   0, 128 
#define TFT_DARKGREEN   0x03E0      //   0, 128,   0 
#define TFT_DARKCYAN    0x03EF      //   0, 128, 128 
#define TFT_MAROON      0x7800      // 128,   0,   0 
#define TFT_PURPLE      0x780F      // 128,   0, 128 
#define TFT_OLIVE       0x7BE0      // 128, 128,   0 
#define TFT_LIGHTGREY   0xD69A      // 211, 211, 211 
#define TFT_DARKGREY    0x7BEF      // 128, 128, 128 
#define TFT_BLUE        0x001F      //   0,   0, 255 
#define TFT_GREEN       0x07E0      //   0, 255,   0 
#define TFT_CYAN        0x07FF      //   0, 255, 255 
#define TFT_RED         0xF800      // 255,   0,   0 
#define TFT_MAGENTA     0xF81F      // 255,   0, 255 
#define TFT_YELLOW      0xFFE0      // 255, 255,   0 
#define TFT_WHITE       0xFFFF      // 255, 255, 255 
#define TFT_ORANGE      0xFDA0      // 255, 180,   0 
#define TFT_GREENYELLOW 0xB7E0      // 180, 255,   0 
#define TFT_PINK        0xFE19      // 255, 192, 203  
#define TFT_BROWN       0x9A60      // 150,  75,   0 
#define TFT_GOLD        0xFEA0      // 255, 215,   0 
#define TFT_SILVER      0xC618      // 192, 192, 192 
#define TFT_SKYBLUE     0x867D      // 135, 206, 235 
#define TFT_VIOLET      0x915C      // 180,  46, 226 

#define color1 TFT_WHITE
#define color2 TFT_BLUE
#define color3 TFT_DARKGREY
#define color4 TFT_YELLOW
#define color5 TFT_BLACK

#define DISPLAY_SIZE  240                                         // Max X & Y pixel size of display ( I use a ST7789 240x240)
#define SIDE_OFFSET   5                                           // not used space around the outside of the display
#define SPRITE_SIZE   ( DISPLAY_SIZE - ( SIDE_OFFSET * 2 ) )      // useable size of the sprite image
#define FACE_R        ( SPRITE_SIZE / 2 )                         // max radius of the sprite image (half the useable size)
#define CHAR_DIAM     FACE_R - 16                                 // outer circle, used by the minute characters alignment
#define CIRCLE_DOTS   FACE_R - 32                                 // inner circle, used by the dotted line alignment
#define SMALL_CIRCLE  FACE_R - 38                                 // even smaller circle used to determine the 5 minutes lines size
#define CENTRE_X      DISPLAY_SIZE / 2                            // define the center of the screen
#define CENTRE_Y      DISPLAY_SIZE / 2                            // define the center of the screen

float Deg2Rad         = 0.01745329251994;                         // Degree to Radians ratio =  0.01745329251994
                                                                  // the SIN, COS and TAN functions requires a radian rather than a degree
                                                                  // to go from degrees to radians, we need to multiply the given value with π / 180 ( Pi / 180 )
                                                                  
float Second_charX[360];        // array of 360 floats to hold the X position of the rotating second characters, filled in setup()
float Second_charY[360];        // array of 360 floats to hold the Y position of the rotating second characters, filled in setup()

float Pixel_X[360];             // array of 360 floats to hold the X position of the dots to create the rotating circle, filled in setup()
float Pixel_Y[360];             // array of 360 floats to hold the Y position of the dots to create the rotating circle, filled in setup()

float MarkerLineX[360];         // array of 360 floats to hold the X position of the inside 5 second marker lines, rotating with the circle, filled in setup()
float MarkerLineY[360];         // array of 360 floats to hold the Y position of the inside 5 second marker lines, rotating with the circle, filled in setup()

String  FiveSecondChars[12]     = {"45","40","35","30","25","20","15","10","05","00","55","50"};
String  weekdays[]              = {"SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"};           // weekdays[2] will give TUESDAY
int     FiveSecondCount[12];    // array of 12 integers, used to store the 5 seconds relative positions, filled in setup()
int     OneSecondCount[60];     // array of 60 integers, used to store the 1 seconds relative positions, filled in setup()

int     forwardangle            = 0;
boolean    onOff                = false;
boolean    debounce             = false;

String hourstring;              // used to show time on the clockface
String minutestring;            // used to show time on the clockface
String secondstring;            // used to show time on the clockface

String d1;                      // first digit of the day used to show time on the clockface
String d2;                      // second digit of the day used to show time on the clockface
String m1;                      // first digit of the month used to show time on the clockface
String m2;                      // second digit of the month used to show time on the clockface

float Hor_Pos                   = 100;
bool  LeftRight                 = false;
int   reverseangle              = 359;

// Time h:m:s
uint8_t h                       = 0;
uint8_t m                       = 0; 
uint8_t s                       = 0;
float   time_secs               = h * 3600 + m * 60 + s;




//====================================================================================================
// Begin calcDayOfWeek( D, M, Y)
//====================================================================================================
byte   calcDayOfWeek(int d, int m, int y)                     // 1 <= m <= 12,  y > 1752 (in the U.K.)
{                                                             // https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week
  y = y + 2000;                                               // added for correct DayOfWeek caclulation
  static int t[] = {0, 3, 2, 5, 0, 3, 5, 1, 4, 6, 2, 4};      // array with calculation offset's per month
  y -= m < 3;                                                 // y = y - (m < 3)? So, if Month is Jan or Feb (m < 3 = true) year becomes year - 1?
  return (y + y / 4 - y / 100 + y / 400 + t[m - 1] + d) % 7;  // Sun=0, Mon=1, Tue=2, Wed=3, Thu=4, Fri=5, Sat=6.  [m-1] is done to adress the array[], 0-11 instead of 1-12
}
//====================================================================================================
// End calcDayOfWeek( D, M, Y)
//====================================================================================================

//========================================================================================
// Begin renderFace(), Draw the clock face in the sprite
//========================================================================================
static void renderFace() {
  //========================================================================================
  // Begin filling arrays with a series of relative X-Y coordinates later used in the program
  //========================================================================================
  int b = 0;   // temporary counter, only used to initially fill the FiveSecondCount[b] array
  int b2 = 0;  // temporary counter, only used to initially fill the OneSecondCount[b2] array

  for (int i = 0; i < 360; i++)  // temporary counter to simulate the 360 degree circle, this counter used in setup(), maybe redifined later!
  {
    Pixel_X[i] = (int(CIRCLE_DOTS) * cos(Deg2Rad * i)) + int(CENTRE_X);  // value of 'i' is used for position the dotted circle and running dot
    Pixel_Y[i] = (int(CIRCLE_DOTS) * sin(Deg2Rad * i)) + int(CENTRE_Y);  // value of 'i' is used for position the dotted circle and running dot

    Second_charX[i] = (int(CHAR_DIAM) * cos(Deg2Rad * i)) + int(CENTRE_X) - SIDE_OFFSET;  // value of 'i' is to place the second characters around the clockface. - SIDE_OFFSET is done to allow for char size
    Second_charY[i] = (int(CHAR_DIAM) * sin(Deg2Rad * i)) + int(CENTRE_Y) - SIDE_OFFSET;  // value of 'i' is to place the second characters around the clockface. - SIDE_OFFSET is done to allow for char size

    MarkerLineX[i] = (int(SMALL_CIRCLE) * cos(Deg2Rad * i)) + int(CENTRE_X);  // value of 'i' is used for position the 5 second marker lines
    MarkerLineY[i] = (int(SMALL_CIRCLE) * sin(Deg2Rad * i)) + int(CENTRE_Y);  // value of 'i' is used for position the 5 second marker lines

    if (i % 30 == 0) {         // value of 'i' is used to find the 5 second positions ( if 360 / 30 has nothing behind the comma )
      FiveSecondCount[b] = i;  // store the 5 second value of the counter 'i' (12 of them)
      b++;
    }

    if (i % 6 == 0) {          // value of 'i' is used to find the 1 (one) second positions ( if 360 / 6 has nothing behind the comma )
      OneSecondCount[b2] = i;  // store the 1 second value of the counter 'i' (60 of them)
      b2++;
    }
  }
  //========================================================================================
  // End filling arrays with a series of relative X-Y coordinates later used in the program
  //========================================================================================
    secondstring  = String(second());                                     // Fill the String with the time set by the Timelib.h library
    minutestring  = String(minute());                                     // Fill the String with the time from the Timelib.h library
    hourstring    = String(hour());                                       // Fill the String with the time from the Timelib.h library
    if( minutestring.toInt()  <10)  minutestring  = "0" + minutestring;   // add leading zero's when needed
    if(   hourstring.toInt()  <10)  hourstring    = "0" + hourstring;     // add leading zero's when needed
    if( secondstring.toInt()  <10)  secondstring  = "0" + secondstring;   // add leading zero's when needed
 
    reverseangle  = reverseangle - 2;                                     // used for the counterclockwise running colored dot
    forwardangle  = second()*6;                                           // used for the moving second marker lines and the second numbers around the clockface, in 6 degree, which is 5 second steps

    if(day()>10)                                                          // use the day() set by the Timelib.h library
        {
        d1 = day() / 10;                                                  // find the individual digits of the day(), needed because they are 'printed' inside a seperate gray box
        d2 = day() % 10;                                                  // find the individual digits of the day(), needed because they are 'printed' inside a seperate gray box
        }
        else
        {
        d1 = "0";                                                         // day() < 10, so a leading 'zero' is created in the first digit
        d2 = String( day() );                                             // find the individual digit of the day(), placed in the second digit
        }

    if(month()>10)                                                        // use the month() set by the Timelib.h library
        {
        m1 = month() / 10;                                                // find the individual digits of the month(), needed because they are 'printed'inside a seperate gray box
        m2 = month() % 10;                                                // find the individual digits of the month(), needed because they are 'printed'inside a seperate gray box
        }
        else
        {
        m1 = "0";                                                         // month() < 10, so a leading 'zero' is created in the first digit
        m2 = String( month() );                                           // find the individual digit of the month(), placed in the second digit
        }
 
    if ( forwardangle >= 360 ) forwardangle = 0;                          // keep the counters within their limits of '0' and '359' (= 360 steps)
    if ( reverseangle <= 0 )   reverseangle = 359;                        // keep the counters within their limits of '0' and '359' (= 360 steps)
    
//====================================================================================================
// Begin Horizontal Position calculation for moving Left to Right and viceversa day string
//====================================================================================================
    if ( LeftRight == false )  Hor_Pos = Hor_Pos + 0.5;  else  Hor_Pos = Hor_Pos - 0.5; // shift right and left, depending on 'LeftRight' boolean
    if ( Hor_Pos > 110 )   LeftRight = !LeftRight;                        // inverse the actual direction 
    if ( Hor_Pos < 50  )   LeftRight = !LeftRight;                        // inverse the actual direction 
//====================================================================================================
// End Horizontal Position calculation for moving Left to Right and viceversa day string
//====================================================================================================




//====================================================================================================
// Begin Clock Face
//==================================================================================================== 
        spr.fillSprite(TFT_BLACK);                                        // The face is completely redrawn - this can be done quickly
        spr.fillCircle(CENTRE_X, CENTRE_Y, FACE_R-7, color5);             // draw clockface solid circle, -7 because something weird on my display regarding centering...
//====================================================================================================
// End Clock Face
//====================================================================================================




//====================================================================================================
// Begin dotted circle
//====================================================================================================
      for(int i=0;i<60;i++) {                                             // local counter 'i' will draw 60 static pixels every time a new clockface is drawn
            spr.fillCircle(Pixel_X[OneSecondCount[i]],Pixel_Y[OneSecondCount[i]],1,color1);
            }
//====================================================================================================
// End dotted circle
//====================================================================================================
            



//====================================================================================================
// Begin Show static pointy thing on top of clock face
//====================================================================================================
      spr.fillTriangle( int(CENTRE_X),                  int(FACE_R)-int(SMALL_CIRCLE)+   int(SIDE_OFFSET) ,
                        int(CENTRE_X)-int(SIDE_OFFSET), int(FACE_R)-int(SMALL_CIRCLE)+(2*int(SIDE_OFFSET)),
                        int(CENTRE_X)+int(SIDE_OFFSET), int(FACE_R)-int(SMALL_CIRCLE)+(2*int(SIDE_OFFSET)), 
                        TFT_ORANGE);
      // the 3 X,Y pairs describe the 3 corners of the triangle that will be filled, the last (7th) parameter is the colour. 
      // X1,Y1 TOP, X2,Y2 Left Bottom, X3,Y3 Right Bottom. Just re-using exiting variables
      // where X=0, Y=0 is in the TOP LEFT Corner of the display, and X=240, Y=240 in the bottom Right corner
//====================================================================================================
// End Show static pointy thing on top of clock face
//====================================================================================================




//====================================================================================================
// Begin show running red dot
//====================================================================================================       
    spr.fillCircle(Pixel_X[reverseangle], Pixel_Y[reverseangle], 3,     TFT_RED);         // Red dot running counterclockwise, based on total speed and reverseangle = reverseangle - 2;
    spr.drawCircle(Pixel_X[reverseangle], Pixel_Y[reverseangle], 4,     TFT_WHITE);       // WHITE circle running counterclockwise, based on total speed and reverseangle = reverseangle - 2;
    spr.drawCircle(Pixel_X[reverseangle], Pixel_Y[reverseangle], 5,     TFT_BLUE);        // BLUE  circle running counterclockwise, based on total speed and reverseangle = reverseangle - 2;
    spr.drawCircle(Pixel_X[reverseangle], Pixel_Y[reverseangle], 6,     TFT_BLUE);        // BLUE  circle running counterclockwise, based on total speed and reverseangle = reverseangle - 2;
    spr.drawCircle(Pixel_X[reverseangle], Pixel_Y[reverseangle], 7,     TFT_BLUE);        // BLUE  circle running counterclockwise, based on total speed and reverseangle = reverseangle - 2;
    //            (X-position           , Y-position           , size,  colour)           // using the earlier -in setup()- calculated X-Y coordinates
//====================================================================================================
// End  show running red dot
//====================================================================================================




//====================================================================================================
// Begin 5 minute line and minute markers
//====================================================================================================
    spr.setTextColor(TFT_YELLOW,color5);                                                  // Motion of the 5 second circle intervals FiveSecondCount[i] should be in one second-steps, that is why forwardangle is 'second()*6', to get a full 360 circle in 60 steps.
    for( int i = 0 ; i < 12 ; i++ ) {                                                     // so, 1 sec * 6 = 6, 10 sec * 6 = 60, etc. 59 sec * 6 = 354. forwardangle increases in steps of 6, equivalent of 5 seconds
      int i2 = FiveSecondCount[i] + forwardangle ;                                        // this makes every 5-second position move forward in 1 second increments.
      if (i2 >= 360 ) { i2 = i2 - 360; }                                                  // But the sum of FiveSecondCount[i] + forwardangle can get bigger than 359! (max position), so if that happens we begin a new circle                                                                                                                 
        spr.drawString(FiveSecondChars[i], Second_charX[i2] -2, Second_charY[i2] -2, 2);  // this line of code generates the second numbers around the clockface. The -2 in position is to better align the text with the circle
        spr.drawLine(Pixel_X[i2], Pixel_Y[i2], MarkerLineX[i2], MarkerLineY[i2], color1); // 5 second, small line markers are drawn in this line
    }
//====================================================================================================
// End 5 minute line and minute markers
//====================================================================================================



 
//====================================================================================================
// Begin Moving left to right and back day text
//====================================================================================================        
        spr.setTextColor(TFT_WHITE,color5);
        spr.drawString(weekdays[ calcDayOfWeek(day(), month(), year() )], Hor_Pos,  (CENTRE_Y -2),    2);
        //            ( string                                          , X-pos ,  Y-pos,       colour)
//====================================================================================================
// End Moving left to right and back day text
//====================================================================================================




//====================================================================================================
// Begin seconds BIG
//====================================================================================================
      spr.setFreeFont(&DSEG7_Modern_Bold_20);
      spr.drawString(secondstring, CENTRE_X-16, CENTRE_Y-55);
//====================================================================================================
// End seconds BIG
//====================================================================================================




//====================================================================================================
// Begin Hour:Min BIG
//====================================================================================================      
      spr.setFreeFont(&DSEG7_Classic_Regular_28);
      spr.drawString(hourstring + ":" + minutestring, CENTRE_X-50, CENTRE_Y+22);
//====================================================================================================
// End Hour:Min BIG
//====================================================================================================




//====================================================================================================
// Begin 4x grey rectangle for day and month
//====================================================================================================      
      spr.setTextFont(0);
      spr.fillRect(66,  86, 12, 20, color3);                                // locations manually selected to look nice
      spr.fillRect(80,  86, 12, 20, color3);
      spr.fillRect(150, 86, 12, 20, color3);
      spr.fillRect(164, 86, 12, 20, color3);
      //         ( X  ,  Y , Width, Height, Colour )
//====================================================================================================
// End 4x grey rectangle for day and month
//====================================================================================================




//====================================================================================================
// Begin Month and Day Text above rectangles
//====================================================================================================
      spr.setTextColor(TFT_SKYBLUE,TFT_BLACK);                              // colour was: 0x35D7, TFT_BLACK
      spr.drawString("MONTH", 64,   75);                                    // locations manually selected to look nice
      spr.drawString("DAY",   155,  75);
      //            ( string, X,    Y )
//====================================================================================================
// End Month and Day Text above rectangles
//====================================================================================================




//====================================================================================================
// Begin Month and Day values inside rectangles
//====================================================================================================
      spr.setTextColor(TFT_WHITE,color3);                                   // place the month and day values in the rectangles
      spr.drawString(m1,  69,   88, 2);                                     // locations manually selected to look nice
      spr.drawString(m2,  83,   88, 2);
      spr.drawString(d1,  152,  88, 2);
      spr.drawString(d2,  166,  88, 2);
      //            (TEXT,  X,   Y, size)
//====================================================================================================
// End Month and Day values inside rectangles
//====================================================================================================
      



//====================================================================================================
// Begin some extra text and ornaments
//====================================================================================================
      spr.setTextFont(0);                                                   // Version color changes based on WiFi reconnect- and WatchDogTimer-status
      if ( (WiFiRefresh == 0) && ( reason == ESP_RST_POWERON  ) ) spr.setTextColor(TFT_GREEN,  TFT_BLACK);
      if ( (WiFiRefresh == 1) && ( reason == ESP_RST_POWERON  ) ) spr.setTextColor(TFT_YELLOW, TFT_BLACK);     
      if ( (WiFiRefresh == 0) && ( reason == ESP_RST_TASK_WDT ) ) spr.setTextColor(TFT_RED,    TFT_BLACK);  
      if ( (WiFiRefresh == 1) && ( reason == ESP_RST_TASK_WDT ) ) spr.setTextColor(TFT_PURPLE, TFT_BLACK);        
      spr.drawString(VersionNumber,CENTRE_X-14,CENTRE_Y-16);
      spr.setTextFont(0);
      spr.setTextColor(TFT_ORANGE,TFT_BLACK);
      spr.drawString("PHMS WATCH",CENTRE_X-29, CENTRE_Y+60);
//====================================================================================================
// End some extra text and ornaments
//====================================================================================================
 

//====================================================================================================
// Begin show complete clock face
//====================================================================================================      
      spr.pushSprite(0, 0);                                                 // Force the Clock to show
//====================================================================================================
// End  show complete clock face
//====================================================================================================
}
//====================================================================================================
// End renderFace(), Draw the clock face in the sprite
//====================================================================================================