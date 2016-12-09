import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.mapdisplay.shaders.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.providers.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.utils.*;
import processing.serial.*;
import cc.arduino.*;
import spacebrew.*;

UnfoldingMap map;
Location SaoPaulo = new Location(-23.5734839, -46.6756268);
Location local1 = new Location(SaoPaulo);
Location local2 = new Location(SaoPaulo);
float valueLat;
float valueLong;
//float teste = 3.40282347E+38;

Spacebrew sb;
String server="sandbox.spacebrew.cc";
String name="Recebe coordenadas - Gertrudes";
String description="Envia coordenadas geograficas";
// link para visualizacao das conexoes:
// http://spacebrew.github.io/spacebrew/admin/admin.html?server=sandbox.spacebrew.cc

Arduino arduino;
boolean arduinoON = false;
int passoX = 420; // 100mm
int passoY = passoX/4;  // 100mm

void setup() {
  size(800, 600);
  smooth();
  setupMapa();
  setupSpacebrew();
  //setupArduino();
  //println(teste);
}

void draw() {
  //background(255);
  //map.draw();  
  
  int s = second();
  int m = minute();
  int h = hour();

  strokeWeight(2);
  stroke(0);
  ScreenPosition antes = map.getScreenPosition(local1);
  ScreenPosition atual = map.getScreenPosition(local2);
  if (antes != atual) {
    //println("Antes: " + local1 + " Atual: " + local2 + 
    //" às: " + h + ":" + m + ":" + s);
    line(antes.x, antes.y, atual.x, atual.y);
  }
}

void keyPressed() {
  if (arduinoON == true) {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        stepX(false, passoX);
      }
      if (keyCode == LEFT) {
        stepX(true, passoX);
      }
      if (keyCode == UP) {
        stepY(false, passoY);
      }
      if (keyCode == DOWN) {
        stepY(true, passoY);
      }
    }
  }
}

void onStringMessage( String name, String value ) { //função q executa quando recebe string do servidor
  local1.setLat(local2.x);
  local1.setLon(local2.y);

  int s = second();
  int m = minute();
  int h = hour();
  println("recebido"  + " às: " + h + ":" + m + ":" + s);
  //println("local1LAT = " + local1.x + " local1LONG = "   + local1.y + " às: " + h + ":" + m + ":" + s);
  if (name.equals("lat")) {
    valueLat = float(value);
    local2.setLat(valueLat);
    //println(valueLat);
  }
  if (name.equals("long")) {
    valueLong = float(value);
    local2.setLon(valueLong);
    //println(valueLong);
  }
  //println("local2LAT = " + local2.x + " local2LONG = "   + local2.y + " às: " + h + ":" + m + ":" + s);
  sb.send("recebido", true);
  println("Antes: " + local1 + " Atual: " + local2 + 
    " às: " + h + ":" + m + ":" + s);
}