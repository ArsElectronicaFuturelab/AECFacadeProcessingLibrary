
class HouseDrawer {
  AECPlugin aec;
  int size = 10;  
  PFont font;
  boolean showIds = false;
  
  public HouseDrawer(AECPlugin aec_) {
    aec = aec_;
    font = loadFont("LucidaConsole-8.vlw"); 
  }
  
  public void toggleIds() {
    showIds = !showIds;
  }
  
  public void draw() {
    resetMatrix();
    
    for (int i = 0; i < Building.SIDE.values().length; ++i) {
      Building.SIDE sideEnum = Building.SIDE.values()[i];
      Side side = aec.getSide(sideEnum);
      
      stroke(side.getColor().getRed(), side.getColor().getGreen(), side.getColor().getBlue(), side.getColor().getAlpha());
      noFill();
      drawSide(side);     
    }
  }
  
  void drawSide(Side s) {
    int[][] adr = s.getWindowAddress();
    int pWidth = s.getPixelWidth();
    int pHeight = s.getPixelHeight();

    for (int y = 0; y < adr.length; ++y) {
      for (int x = 0; x < adr[y].length; ++x) {
        if (adr[y][x] > -1) {
          int fx = (s.getX() + x * pWidth) * aec.scale;
          int fy = (s.getY() + y * pHeight) * aec.scale;
          rect(fx, fy, pWidth * aec.scale, pHeight * aec.scale);
          
          if (showIds) {
            textFont(font, 8); 
            text("" + adr[y][x], fx + pWidth * aec.scale / 4, fy + pHeight * aec.scale * 0.9);
          }
        }
      }
    }
  }
}
