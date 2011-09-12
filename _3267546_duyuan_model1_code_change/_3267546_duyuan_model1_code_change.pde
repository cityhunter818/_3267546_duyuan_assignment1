#include <Firmata.h>

int ledpin0 = 11; // choose the pin for the LED  
int ledPin1 =  12;        
int inputPin = 2;  // button  
int Putbutton = 0; // but the button function
int lightPin = 0; // The photoresistor is to Analog 0   
int lightChange;  // Make photoresistor change light and it works
int lightmapped;  // The photoresistor the light

int APin1 = 0;    // For Grasshopper Read the pin
int APin2 = 0;
int APin3 = 0;
int APin4 = 0;
int APin5 = 0;
int DPin4 = 0;
int DPin7 = 0; 
boolean active = false;

void setup()  {  
  Firmata.setFirmwareVersion(0, 1);
  Firmata.begin(57600);
  pinMode(ledpin0, OUTPUT); // declare LED as output
  pinMode(ledPin1, OUTPUT); 
  pinMode(lightPin, INPUT); // make photoresistor as an input      
  pinMode(inputPin, INPUT); // make button as an input   
}

void loop(){
  CheckBotton(); // Make the botton work with leds 
  lightinput();    // Make the photoresistor work with leds
  
  APin1 = analogRead(1); // For Grasshopper Read the pin
  APin2 = analogRead(2); 
  APin3 = analogRead(3); 
  APin4 = analogRead(4); 
  APin5 = analogRead(5); 
  DPin4 = digitalRead(4);  
  DPin7 = digitalRead(7); 
  
  //Serial.print(lightmapped);
  Firmata.sendAnalog(0, lightmapped);
  delay(500);
}

void lightinput(){
  lightChange = analogRead(lightPin);   //Read the photoresistor
  lightmapped = constrain(lightChange,0,500);  //Read the photoresistor level 
  analogWrite(ledpin0,lightmapped);          
}

void CheckBotton(){
  Putbutton = digitalRead(inputPin);  //Read the botton  
  if (Putbutton == HIGH) {
  digitalWrite(ledPin1, LOW); // turn Led1 ON 
  } 
  else {digitalWrite(ledPin1, HIGH); // turn Led1 OFF
  }
}
