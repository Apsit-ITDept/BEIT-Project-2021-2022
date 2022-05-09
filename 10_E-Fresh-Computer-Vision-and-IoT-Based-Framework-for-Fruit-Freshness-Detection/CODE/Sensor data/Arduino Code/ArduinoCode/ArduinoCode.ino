#define USE_ARDUINO_INTERRUPTS true    // Set-up low-level interrupts for most acurate BPM math.
//#include <Simpletimer.h>
//#include <ESP8266WiFi.h>  // Includes the PulseSensorPlayground Library.   
#include <SoftwareSerial.h>
#include<ArduinoJson.h>
//SimpleTimer timer;
SoftwareSerial s(5,6);


//  Variables
const int Mq3Wire = 0;       // PulseSensor PURPLE WIRE connected to ANALOG PIN 0
const int Mq4Wire = 1;
int MQ3 = 0;
int MQ4 = 0;
const int LED13 = 13;          // The on-board Arduino LED, close to PIN 13.
String MQ3_str;
String MQ4_str;                              
                               

void setup() {   

  Serial.begin(115200);     // For Serial Monitor
  s.begin(115200);          
  pinMode(Mq3Wire,INPUT);
  pinMode(Mq4Wire,INPUT);
  delay(2000);

  
}



void loop() {

 MQ3 = analogRead(Mq3Wire); 
 MQ4 = analogRead(Mq4Wire);
 delay(1500);
 Serial.println(MQ3);                        
 Serial.println(MQ4);
   
 StaticJsonBuffer<1000> jsonBuffer;
 JsonObject& root = jsonBuffer.createObject();
 root["MQ3"] = MQ3;
 root["MQ4"] = MQ4;

 root.printTo(s);
 jsonBuffer.clear();
 delay(1000);
}
  
