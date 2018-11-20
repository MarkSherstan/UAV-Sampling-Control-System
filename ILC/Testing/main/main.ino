#include <Servo.h>

Servo myServo;

// Declare some variables
int encoderPin1 = 2;
int encoderPin2 = 3;
int lastMSB = 0; // most significant bit
int lastLSB = 0; // least significant bit
long lastencoderValue = 0;
volatile int lastEncoded = 0;
volatile long encoderValue = 0;

int sensorValue;
float voltage;

int scale = 185;  // mV/A
int offSet = 2500; // mV
int currentSensor;
double amps;

void setup() {
  Serial.begin(57600);

  myServo.attach(9);
  myServo.writeMicroseconds(1520);

  // declare pin 2 and 3 as input, turn pullup resistor on and call updateEncoder()
  // when there is a change
  pinMode(encoderPin1, INPUT);
  pinMode(encoderPin2, INPUT);
  digitalWrite(encoderPin1, HIGH);
  digitalWrite(encoderPin2, HIGH);
  attachInterrupt(0, updateEncoder, CHANGE);
  attachInterrupt(1, updateEncoder, CHANGE);

  delay(3000);
  Serial.println("Starting");
}


void loop() {
  int PWM = 1000;
  myServo.writeMicroseconds(PWM);

  sensorValue = analogRead(A0);
  voltage = sensorValue * (5.0 / 1023.0);

  currentSensor = analogRead(A2);
  amps = (((currentSensor / 1024.0) * 5000) - offSet) / scale;

  // 360/80 = 4.5 degrees per step... First step is "2" the rest are 4. Really its a half step
  Serial.print(micros()); Serial.print(",");
  Serial.print((float)encoderValue * (360.0 / 80.0),1); Serial.print(",");
  Serial.print(voltage); Serial.print(",");
  Serial.print(amps*1000,3); Serial.print(",");
  Serial.println(PWM);

  if (micros()*0.000001 > 20){
    Serial.println("STOP");
     myServo.writeMicroseconds(1520);
     delay(10000);
  }
}


void updateEncoder() {
  // Get data
  int MSB = digitalRead(encoderPin1);
  int LSB = digitalRead(encoderPin2);

  // Convert the 2 pin values to single number using bit shift and add to previous value
  int encoded = (MSB << 1) | LSB;
  int sum = (lastEncoded << 2) | encoded;

  // Calculate if there should be an increase or decrease in encoder value then store
  if (sum == 0b1101 || sum == 0b0100 || sum == 0b0010 || sum == 0b1011) encoderValue ++;
  if (sum == 0b1110 || sum == 0b0111 || sum == 0b0001 || sum == 0b1000) encoderValue --;
  lastEncoded = encoded;

  // Keep value bounded between [-80 and 80] --> one rotation
  if (encoderValue >= 80) {
    encoderValue -= 80;
  } else if (encoderValue <= -80) {
    encoderValue += 80;
  }

}