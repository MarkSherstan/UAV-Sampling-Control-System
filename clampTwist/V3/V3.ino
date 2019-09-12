#include <Servo.h>

//Declaring Variables
int scale = 185;    // mV/A
int offSet = 2500;  // mV
int currentSensor;
double milliAmps;
byte lastChannel;
int receiverInputChannel;
unsigned long timer;
Servo myservo;


// For the force sensative resistors
const int FSR_PIN[] = {2, 3};
const float VCC = 4.98;
const float R_DIV = 5100.0;

int fsrADC;
float fsrV, fsrR, fsrG;
float force[2];



void setup(){
  // Serial coms
  Serial.begin(9600);

  // Set Atmega pin default to input. Scan and set PCINT0 (D53) interrupt.
  PCICR |= (1 << PCIE0);
  PCMSK0 |= (1 << PCINT0);

  // Servo
  myservo.attach(9);
  myservo.writeMicroseconds(1520);

  // Initialize LED and turn off
  pinMode(10, OUTPUT);
  digitalWrite(10, LOW);
}


void loop(){
  // Read current sensor and calculate a value
  currentSensor = analogRead(A0);
  milliAmps = (((currentSensor / 1024.0) * 5000) - offSet) / scale;
  Serial.print(milliAmps);

  // If current high flash LED
  if (milliAmps >= 0.2){
    for (int i = 0; i <= 15; i++) {
      digitalWrite(10, HIGH);
      delay(100);
      digitalWrite(10, LOW);
      delay(100);
    }
  }

  // Reading RC signal and sending signal to servo
  if (receiverInputChannel - 1480 < 0){
    myservo.writeMicroseconds(1000);
  } else if (receiverInputChannel - 1520 > 0){
    myservo.writeMicroseconds(2000);
  } else {
    myservo.writeMicroseconds(1520);
  }

  Serial.print("\t"); Serial.println(receiverInputChannel);
}

void readFSR(){
  for (int ii = 0; ii < 2; ii++){
    // Read pin
    fsrADC = analogRead(FSR_PIN[ii]);

    // Use ADC reading to calculate voltage:
    fsrV = fsrADC * VCC / 1023.0;

    // Use voltage and static resistor value to calculate FSR resistance:
    fsrR = ((VCC - fsrV) * R_DIV) / fsrV;

    // Guesstimate force based on slopes in figure 3 of FSR datasheet (conductance):
    fsrG = 1.0 / fsrR;

    // Break parabolic curve down into two linear slopes:
    if (fsrR <= 600)
      force[ii] = (fsrG - 0.00075) / 0.00000032639;
    else
      force[ii] =  fsrG / 0.000000642857;
    }
}

ISR(PCINT0_vect){
  // Input changed from 0 to 1
  if(lastChannel == 0 && PINB & B00000001 ){
    lastChannel = 1;
    timer = micros();
  }
  // Input changed from 1 to 0
  else if(lastChannel == 1 && !(PINB & B00000001)){
    lastChannel = 0;
    receiverInputChannel = micros() - timer;
  }
}
