import spacebrew.*;
import ketai.sensors.*;

double longitude, latitude, altitude;
String longINT, latINT, altINT;
float longi, lati, alti;
String latView, longView, altView;

KetaiLocation location;

String server="gertrudes.herokuapp.com/index.html?server=gertrudes.herokuapp.com&port=80"; // sandbox.spacebrew.cc
String name="Envia coordenadas - Gertrudes";
String description="Envia coordenadas geograficas";

Spacebrew sb;

boolean recebido = false;
int hora, minuto, segundo;


void setup() {
  fullScreen();
  //size(1080, 1920);
  textAlign(CENTER, CENTER);
  textSize(36);
  sb = new Spacebrew(this);

  sb.addPublish("latitude", "string", latINT);
  sb.addPublish("longitude", "string", longINT);
  //sb.addPublish("altitude", "string", altINT);
  sb.addSubscribe("recebido", "boolean");

  sb.connect(server, name, description);
}

void draw() {
  int s = second();
  int m = minute();
  int h = hour();
  background(#86CB89);
  if (location == null)
    location = new KetaiLocation(this);
  text("Hora atual " + h + ":" + m + ":" + s + "\n", 0, 0, width, height - 200);
  if (location.getProvider() == "none")
    text("Gps indisponivel. \n Por favor cheque as configuracoes de localização", 
      0, 0, width, height);
  else
    text("Latitude: " + latitude + "\n" + 
      "Longitude: " + longitude + "\n" + 
      //"Altitude: " + alti + "\n" + 
      "Provedor: " + location.getProvider()
      , 0, 0, width, height);
  if (recebido == true)
    text("ultimo envio às: " + hora + ":" + minuto + ":" + segundo, 
      0, 0, width, height + 200);
}

void onBooleanMessage(String name, boolean value) {
  if (name.equals("recebido") && value == true) {
    recebido = true;
  }
  hora = hour();
  minuto = minute();
  segundo = second();
  println(name + "  " + value);
  background(#D12C2C);
}

void onLocationEvent(double _latitude, double _longitude, double _altitude)
{
  longitude = _longitude;
  latitude = _latitude;
  //altitude = _altitude;

  float longi = (float)longitude;
  float lati = (float)latitude;
  //float alti = (float)altitude;
  //println("lat/lon/alt: " + lati + "/" + longi + "/" + alti);

  String longINT = str(longi);
  String latINT = str(lati);
  //String altINT = str(alti);

  sb.send("latitude", latINT);
  sb.send("longitude", longINT);
  //sb.send("altitude", altINT);
}