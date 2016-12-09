void setupMapa() {
  map = new UnfoldingMap(this); 
  map.zoomAndPanTo(SaoPaulo, 13);
  float maxPanningDistance = 0;
  map.setPanningRestriction(SaoPaulo, maxPanningDistance);
  map.setZoomRange(12, 12);
  //MapUtils.createDefaultEventDispatcher(this, map);
  println("mapa pronto");
}