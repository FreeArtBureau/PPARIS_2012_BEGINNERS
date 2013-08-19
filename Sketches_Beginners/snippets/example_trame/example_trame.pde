import processing.video.*;

Capture myCapture;

void setup() {
  size(900, 700);
  println(Capture.list());
  smooth();
  myCapture = new Capture(this, 64, 48, 30);
}

void draw() {
  println(mouseX);
  background(255);
  image(myCapture, 10, 10);

  translate(width/2, height/2);

  stroke(0);
  noFill();
  int numH = myCapture.width;
  int numV = myCapture.height;
  float space = mouseX;
  float offsetH = (numH - 1) * space / 2; 
  float offsetV = (numV - 1) * space / 2;
  for (int j=0; j<numV; j++) {  
    for (int i=0; i<numH; i++) {
      
      color c = myCapture.get(i,j);
      float b = brightness(c);

      float diam = (255-b) * 0.05;
      float rot = b * 0.01;
      float x = i * space - offsetH; 
      float y = j * space - offsetV;      
      pushMatrix();
      translate(x,y);
      //rotate(rot);
      line(0,0,diam,diam);  
      //ellipse(0,0, diam, diam);
      popMatrix();
    }
  }
}

void captureEvent(Capture myCapture) {
  myCapture.read();
}





