import processing.opengl.*;

void setup() {
  size(800, 600, OPENGL);
  sphereDetail(120);
  smooth();
  background(128);
  
}

void mousePressed(){
  background(128);
}


void draw() {
  //background(255);
  lights();
  translate(width/2, height/2);
  
  rotateX(mouseY * 0.1);  
  rotateY(frameCount * 0.012);
  rotateZ(frameCount * 0.013);

  translate(150, 0, 0);
  fill(255);
  noStroke();  
  sphere(8);

  rotateX(frameCount * 0.025);
  rotateY(frameCount * 0.0112);
  rotateZ(frameCount * 0.0312);


  translate(50, 0, 0);
  /*
  float r = (sin(frameCount * 0.0111) + 1) * 127.5;
  float g = (sin(frameCount * 0.0121) + 1) * 127.5;
  float b = (sin(frameCount * 0.0131) + 1) * 127.5;
  fill(r,g,b);
  */
  
  if (frameCount/4 % 2 == 0) {
    fill(0);
  }else{
    fill(255);
  }
  
  float rad = sin(frameCount*0.016) * 40 + 60;
  sphere(rad);

}

