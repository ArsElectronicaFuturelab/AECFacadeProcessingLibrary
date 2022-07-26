AEC aec;

void setup() {
  //try 60?
  frameRate(25);
  size(1200, 400);
    
  aec = new AEC();
  aec.init();
  setupPharus();

}

void draw() {
  aec.beginDraw();
  
  background(0,0,0);
  noStroke();
  
  drawPharus();
  fill(255);
  ellipse(mouseX / aec.getScaleX(), mouseY / aec.getScaleY(), 3 , 4);
  aec.endDraw();
  aec.drawSides();
}


void keyPressed() {
  aec.keyPressed(key);
}
