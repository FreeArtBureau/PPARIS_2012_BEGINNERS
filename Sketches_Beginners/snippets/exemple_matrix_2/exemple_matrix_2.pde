import processing.opengl.*;

void setup() {
  size(800, 600, OPENGL);
}


void draw() {
  background(255);
  translate(width/2, height/2);
  
  rotateX(mouseY * 0.1);
  
  //SOLEIL
  pushMatrix();
  noStroke();
  fill(255, 200, 0);
  sphere(30);

  //TERRE
  noFill();
  stroke(0, 100);
  ellipse(0, 0, 300, 300);
  rotate(frameCount * 0.01);
  translate(150, 0, 0);
  fill(100, 109, 255);
  noStroke();  
  sphere(8);

  rotate(frameCount * 0.015);
  translate(20, 0, 0);
  fill(140);
  sphere(3);

  popMatrix();

  noFill();
  stroke(0, 100);
  ellipse(0, 0, 440, 440);
  rotate(frameCount * 0.013);
  translate(220, 0, 0);
  fill(130, 109, 255);
  noStroke();  
  sphere(10);
}

