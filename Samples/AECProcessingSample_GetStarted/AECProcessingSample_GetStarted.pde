AEC aec;


void setup() {
  frameRate(25);
  size(1200, 400);
  
  aec = new AEC();
  aec.init();
}

void draw() {
  aec.beginDraw();
  //background(0,0,0);
  noStroke();
  
  if (mousePressed) {
    fill(0);
  } else {
    fill(255);
    //fill(random(0, 255),random(0, 255),random(0, 255));
  }
  ellipse(mouseX / aec.getScaleX(), mouseY / aec.getScaleY(), 3, 4);
  
  aec.endDraw();
  aec.drawSides();
}
