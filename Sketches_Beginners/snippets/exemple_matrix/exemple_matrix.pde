void setup() {
  size(800, 600);
}


void draw() {
  background(200);
  
  pushMatrix();  
  translate(100, 120);  
  rect(0, 0, 150, 50);
  
  translate(170, 0);
  rect(0, 0, 150, 50);
  
  rotate(0.2);
  translate(170, 0);
  rect(0, 0, 150, 50);

  popMatrix();
  translate(100, 180);
  rect(0, 0, 150, 50);  
}

