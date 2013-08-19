import processing.opengl.*;

void setup() {
  size(800, 600, OPENGL);
}


void draw() {
  background(255);
  beginShape();
  noStroke();

  fill(255, 0, 0);   
  vertex(20, 20);
  
  fill(0, 255, 0);   
  vertex(500, 20);
  
  fill(0, 0, 255); 
  vertex(mouseX, mouseY);

  endShape(CLOSE);
}

