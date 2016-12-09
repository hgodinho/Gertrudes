void stepX(boolean dirX, int stepsX) {
  //println(dirX);
  if (dirX==true) {
    arduino.digitalWrite(dirXpin, Arduino.HIGH);
    for (int i=0; i<stepsX; i++) {
      arduino.digitalWrite(passoXpin, Arduino.HIGH);
      delay(10/10000);
      arduino.digitalWrite(passoXpin, Arduino.LOW);
      delay(10/10000);
      //println("tap" + i);
    }
  } else {
    arduino.digitalWrite(dirXpin, Arduino.LOW);
    for (int i=0; i<stepsX; i++) {
      arduino.digitalWrite(passoXpin, Arduino.LOW);
      delay(10/10000);
      arduino.digitalWrite(passoXpin, Arduino.HIGH);
      delay(10/10000);
      //println("tap0");
    }
  }
}

void stepY(boolean dirY, int stepsY) {
  //println(dirY);
  if (dirY==true) {
    arduino.digitalWrite(dirYpin, Arduino.HIGH);
    for (int i=0; i<stepsY; i++) {
      arduino.digitalWrite(passoYpin, Arduino.HIGH);
      delay(800/1000);
      arduino.digitalWrite(passoYpin, Arduino.LOW);
      delay(800/1000);
      // println("tap1");
    }
  } else {
    arduino.digitalWrite(dirYpin, Arduino.LOW);
    for (int i=0; i<stepsY; i++) {
      arduino.digitalWrite(passoYpin, Arduino.LOW);
      delay(800/1000);
      arduino.digitalWrite(passoYpin, Arduino.HIGH);
      delay(800/1000);
      //println("tap0");
    }
  }
}