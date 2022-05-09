#include <TinyGPS++.h>
#include <SoftwareSerial.h>

#define buzzer 6
#define sw A5

// Choose two Arduino pins to use for software serial
int RXPin = 2;
int TXPin = 3;
int RXPin1 = A2;
int TXPin1 = A1;
int RXPin2 = 9;
int TXPin2 = 10;

int GPSBaud = 9600;
String lat1="0.00";
String long1="0.00";
int Count=0;
int heartBeat=0,f=0;
unsigned long currentMillis;
unsigned long previousMillis=0;
// Create a TinyGPS++ object


// Create a software serial port called "gpsSerial"
SoftwareSerial ss(RXPin, TXPin);
SoftwareSerial sim(RXPin1, TXPin1);
SoftwareSerial bl(RXPin2, TXPin2);
TinyGPSPlus gps;

void  gsm(String value1, String value2){
      Serial.println("in GSM"); 
      ss.end();
      sim.begin(9600);
      delay(1000);
      sim.println("AT"); // Configuring TEXT mode
      delay(2000);
      ShowSerialData();      
      sim.println("AT+CMGF=1"); // Configuring TEXT mode
      delay(2000);
      ShowSerialData();
      sim.println("AT+CMGS=\"+919322224527\"");//change ZZ with country code and xxxxxxxxxxx with phone number to sms
      delay(2000);
      ShowSerialData();
      String SMSsentlast = "HELP!! I AM IN TROUBLE.";
      //String SMSsentlast1 = "www.google.com/maps/search/\""+value1+"\",\""+value2+"\"";
      String SMSsentlast1 = "www.google.com/maps/search/"+value1+","+value2;
      sim.println(SMSsentlast); //text content
      delay(100);
      sim.println(SMSsentlast1); //text content
      delay(100);
      sim.write(26);
      delay(5000);
      ShowSerialData();
      sim.end();
      Serial.println("in GSM"); 
      delay(50);
      bl.begin(9600);
      delay(50);
      bl.println(SMSsentlast1); // Configuring TEXT mode
      delay(100);
      bl.end();
      ss.begin(9600);
      Serial.println("GSM-GSM Out");          
}

void setup()
{
    pinMode(buzzer,OUTPUT); digitalWrite(buzzer,LOW);// FOR SWITCH
    //pinMode(A4,INPUT);// digitalWrite(A4,LOW);// FOR SWITCH
    Serial.begin(9600);
    delay(100);
    Serial.println("Woman Safety Device");
    Serial.println("System Initializing, Pl Wait....");
    delay(5000);
    ss.begin(GPSBaud);
    delay(2000);
    Serial.println("System Started");
}

void loop(void)
{
    if (digitalRead(sw) == HIGH )
      {
        Serial.println("Alert");
        digitalWrite(buzzer,HIGH);
        while(f<=1000){
        Serial.println("in GPS");  
        if (ss.available() > 0){
            gps.encode(ss.read());
            if (gps.location.isValid()){
            lat1 = gps.location.lat();
            long1 = gps.location.lng();
            Serial.print("Lat:");
            Serial.println(lat1);
            Serial.print("Lon:");
            Serial.println(long1);
          }        
        }f++;}
        f=0;
        gsm(lat1,long1);
        digitalWrite(buzzer,LOW);
      }

}

void ShowSerialData()
{
  while(sim.available()!=0)  /* If data is available on serial port */
  Serial.write(char (sim.read())); /* Print character received on to the serial monitor */
}
