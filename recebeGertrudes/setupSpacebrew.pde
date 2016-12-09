void setupSpacebrew(){ 
  sb = new Spacebrew(this);
  sb.addSubscribe("lat", "string");
  sb.addSubscribe("long", "string");
  //sb.addSubscribe("alt", "string");
  sb.addPublish("recebido","boolean", false);
  sb.connect(server, name, description);
  
  println("spacebrew pronto");
}