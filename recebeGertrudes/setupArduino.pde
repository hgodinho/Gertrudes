int dirXpin = 7;
int passoXpin = 4;
int dirYpin = 8;
int passoYpin = 5;
int servo = 11;

void setupArduino(){
 //println(Arduino.list()); 
 //arduino = new Arduino(this, Arduino.list()[1], 57600);
 arduino.pinMode(servo,Arduino.SERVO);
 arduino.pinMode(dirXpin,Arduino.OUTPUT);
 arduino.pinMode(passoXpin,Arduino.OUTPUT);
 arduino.pinMode(dirYpin,Arduino.OUTPUT);
 arduino.pinMode(passoYpin,Arduino.OUTPUT);
 arduinoON = true;
 println("Gertrude na linha");
}