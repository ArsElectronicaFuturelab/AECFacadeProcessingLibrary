
AEC aec;

void setup() {
  frameRate(25);
  size(1200, 400);
  
  aec = new AEC();
  aec.init();
  jsonSetup();
}

void draw() {
  aec.beginDraw();

  // DRAW CODE
  int x1 = mouseX / aec.getScaleX();
  int x2 = (frameCount / 3) % 55;
  
  background(0, 0,0);
  noStroke();

  int step = 1;
/*
  for (int y = 0; y < 30; y += step) {
    fill((y % 2 == 0 ? 0 : 254), 0, (y % 2 == 0 ? 254 : 0));
    rect(x1, y, 1, step);
  }
*/
  
  jsonDraw();
    
  aec.endDraw();
  aec.drawSides();


}

void keyPressed() {
  aec.keyPressed(key);
}
