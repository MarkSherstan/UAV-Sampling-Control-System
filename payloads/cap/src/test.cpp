#include <Servo.h>

Servo myservo;

int numReadings = 25;
int bufferA = 0;
int bufferB = 0;

// the setup function runs once when you press reset or power the board
void setup() {
  Serial.begin(9600);
  myservo.attach(4);
}

// the loop function runs over and over again forever
void loop() {
  for (int pos = 0; pos <= 180; pos += 1) { // goes from 0 degrees to 180 degrees
    // in steps of 1 degree
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    readCurrent();
    // smooth();

    delay(15);                       // waits 15ms for the servo to reach the position
  }

  for (int pos = 180; pos >= 0; pos -= 1) { // goes from 180 degrees to 0 degrees
    myservo.write(pos);              // tell servo to go to position in variable 'pos'
    readCurrent();
    // smooth();

    delay(15);                       // waits 15ms for the servo to reach the position
  }
}


void readCurrent() {
  // Read analog pin and process value
  int currentADC = analogRead(A6);
  float amps = ((((float)currentADC / 1023.0) * 5000.0) - 2500.0) / 400.0;
  float milliAmps = amps * 1000;


  int sensorValue = analogRead(A2);
  float voltage = (float)sensorValue * (5.0 / 1023.0);
  float milliAmps2 = voltage / (100 * 0.016) ;


  Serial.print(milliAmps); Serial.print(",");
  Serial.println(milliAmps2 * 1000);
}


void smooth() {
  for (int ii = 0; ii < numReadings; ii++) {
    bufferA += analogRead(A6);;
  }
  float currentADC = (float)bufferA / (float)numReadings;
  float amps = (((currentADC / 1023.0) * 5000.0) - 2500.0) / 400.0;
  float milliAmps = amps * 1000;
  bufferA = 0;


  for (int ii = 0; ii < numReadings; ii++) {
    bufferB += analogRead(A2);
  }
  float sensorValue = (float)bufferB / (float)numReadings;
  float voltage = sensorValue * (5.0 / 1023.0);
  float milliAmps2 = voltage / (100 * 0.016) ;
  bufferB = 0;


  Serial.print(milliAmps); Serial.print(",");
  Serial.println(milliAmps2 * 1000);
}
