import processing.sound.*;

JSONObject json;
JSONObject json2;
JSONObject json3;
JSONObject json4;
String [] timestamps;
JSONArray jsonArr;
JSONArray jsonArr2;
JSONArray jsonArr3;
JSONArray jsonArr4;
String smth;
int offsetX = 10;
int offsetY = 25;
int previousPosX =0;
int previousPosY =0;
int posX = 0;
int posY = 0;
int index = 0;
float vertX[];
float vertY[];
int prevPosX [];
int prevPosY [];

TriOsc tri;
SinOsc[] sineWaves;

int numSines = 5;


void jsonSetup() {
  // background(255);
  // size(800,800);
  json = loadJSONObject("https://dataset.api.hub.zamg.ac.at/v1/station/historical/tawes-v1-10min?parameters=TL&station_ids=11060&start=2022-06-20T11:00:00%2b02:00&end=2022-06-27T12:00:00%2b02:00");
  if (json == null) {
    println("JSON object could not be loaded");
  } else {
    jsonArr = json.getJSONArray("features");
    json2 = json.getJSONArray("features").getJSONObject(0).getJSONObject("geometry");
    jsonArr2 = json2.getJSONArray("coordinates");
    json3 = json.getJSONArray("features").getJSONObject(0).getJSONObject("properties").getJSONObject("parameters").getJSONObject("TL");
    jsonArr3 = json3.getJSONArray("data");
    // smth = jsonArray;

    /*
    sineWaves = new SinOsc[numSines];
     for (int i = 0; i < numSines; i++) {
     
     // Create the Sine Oscillators and start them
     sineWaves[i] = new SinOsc(this);
     sineWaves[i].play();
     }
     */

    tri = new TriOsc(this);
    tri.play();
  }
  vertX = new float [jsonArr3.size()];
  vertY = new float [jsonArr3.size()];
  prevPosX = new int [jsonArr3.size()];
  prevPosY = new int [jsonArr3.size()];

  // println(tstamps);
 // print (json);
 // println("\n__________________");
 // print (jsonArr2);
//  println("\n__________________");
 // print (json2);
 // println("\n__________________");
 // println("\n__________________");
 // print (json3);
//  println("\n__________________");
 // print (jsonArr3.getFloat(0));
}

void jsonDraw() {
  if (index <= jsonArr3.size()-1) {
    pushMatrix();
      if (posX > width) {
        posX = 0;
        posY = previousPosY+offsetY;
      }
      if (posY > height) {
        posY = 0;
      }
      translate(mouseX / aec.getScaleX(), mouseY / aec.getScaleY());//(width*0.2, height*0.5);
      prevPosX[index] =  mouseX / aec.getScaleX(); //<>//
      prevPosY[index] =  mouseY / aec.getScaleY();
      rotate(frameCount / 200.0);
      polygon(0, 0, jsonArr3.getFloat(index), 3, index);  // Triangle
    popMatrix();
    // previousPosX = posX;
    //previousPosY = posY;
    index++;
    posX = posX + offsetX;

    float frequency = map ( jsonArr3.getFloat(index-1), 15.0, 25.0, 80.0, 1000.0);
    tri.freq(frequency);
    //float panning = map(posX, 0, width, -1.0, 1.0);
    float panning = map(jsonArr3.getFloat(index-1), 15.0, 25.0, -1.0, 1.0);
    //print(panning);
    tri.pan(panning);

    /*
      // Map that value to 150 - 1150 Hz
     float sineFrequency = map ( jsonArr3.getFloat(index-1), 15.0, 25.0, 150.0, 1150.0);
     
     float detune = map(posY, 0, height, -0.5, 0.5);
     for (int i = 0; i < numSines; i++) { 
     sineWaves[i].freq(sineFrequency * (i + 1 + i * detune));
     
     }
     */
     for(int i=0; i < index; i++){ //<>//
       pushMatrix();
       translate(prevPosX[i], prevPosY[i]);
       beginShape();
         vertex(vertX[i]/2, vertY[i]/2);
      //   println(vertX[i], vertY[i]);
       endShape();
       popMatrix();
     }
  } 
  else {
    index = 0;
  }
}


void polygon(float x, float y, float radius, int npoints, int index) {
  float angle = TWO_PI / npoints;
  fill(map(radius, 15, 25, 50, 200), 100, 100);
  beginShape();
    for (float a = 0; a < TWO_PI; a += angle) {
      vertX[index] = x + cos(a) * radius;
      vertY[index] = y + sin(a) * radius;
      vertex(vertX[index]/2/*/aec.getScaleX()*/, vertY[index]/2/*/aec.getScaleY()*/);
    }
  endShape(CLOSE);
}

// Sketch prints:
// 0, Panthera leo, Lion
