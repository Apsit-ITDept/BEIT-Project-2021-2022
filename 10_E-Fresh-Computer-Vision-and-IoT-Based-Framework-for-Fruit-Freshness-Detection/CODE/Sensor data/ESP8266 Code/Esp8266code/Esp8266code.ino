#include <SoftwareSerial.h>
SoftwareSerial s(D6, D5);
#include <ArduinoJson.h>
#include <ESP8266WiFi.h>
#include <ThingSpeak.h>
#include <WiFiClientSecure.h>

WiFiClient client;
const char* ssid = "realme 8";
const char* password = "j6hiecb5";
const char* host = "api.thingspeak.com";
const char myWriteAPIKey[] = "8D7SWBGJVE4XB0VX";
long myChannelNumber = 1727848;

//const char* host = "script.google.com";
//const int httpsPort = 443;


//WiFiClientSecure client;

String GS_ID = "1oO686bEe9QZIEjColfKQEIQftAAre_rYN6Plhp9r3uk";

void setup() {
// Open serial communications and wait for port to open:
  Serial.begin(115200);
  s.begin(115200);
  Serial.println("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password);
  while(WiFi.status() != WL_CONNECTED){
    delay(500);
    Serial.print(".");
    }
    Serial.println("");
    Serial.println("WiFi connected");
    Serial.println(WiFi.localIP());
    ThingSpeak.begin(client);
  while (!Serial) {
    continue;
  }
}



void loop() { // run over and over   

  StaticJsonBuffer<1000> jsonBuffer;
  JsonObject& root = jsonBuffer.parseObject(s);
  if(root == JsonObject::invalid()){
    //Serial.println("Invalid");
    jsonBuffer.clear();
    return;
    }
   

  //Serial.println("JSON recieved and parsed");
  
  int data1 = root["MQ3"];
  int data2 = root["MQ4"];
  ThingSpeak.writeField(myChannelNumber, 1, data1, myWriteAPIKey);
  ThingSpeak.writeField(myChannelNumber, 2, data2, myWriteAPIKey);


  
  const int httpPort = 80;
  
  Serial.print("MQ3: ");
  Serial.println(data1);

  Serial.print("MQ4: ");
  Serial.println(data2);
  

  
  Serial.println("------------------------------------");
  Serial.print("Connecting to ");
  Serial.println(host);

  //String string_mq3 = String(data1, DEC);
  //String string_mq4 = String(data2, DEC);
  //String url = "/macros/s/" + GS_ID + "/exec?mq3=" + string_mq3 + "&mq4=" + string_mq4;
  //Serial.print("requesting URL: ");
  //Serial.println(url);

  //client.print(String("GET ") + url + " HTTP/1.1\r\n" +
    //     "Host: " + host + "\r\n" +
      //   "User-Agent: BuildFailureDetectorESP8266\r\n" +
        // "Connection: close\r\n\r\n");

  //Serial.println("request sent");
  //----------------------------------------

  //----------------------------------------Checking whether the data was sent successfully or not
  //while (client.connected()) {
    //String line = client.readStringUntil('\n');
    //if (line == "\r") {
      //Serial.println("headers received");
      //break;
    //}
  //}
  //String line = client.readStringUntil('\n');
  //if (line.startsWith("{\"state\":\"success\"")) {
    //Serial.println("esp8266/Arduino CI successfull!");
  //} else {
    //Serial.println("esp8266/Arduino CI has failed");
  //}
  //Serial.print("reply was : ");
  //Serial.println(line);
  //Serial.println("closing connection");
  //Serial.println("==========");
  //Serial.println(); 


  
  //client.stop();
 
  delay(2000);
  
}
