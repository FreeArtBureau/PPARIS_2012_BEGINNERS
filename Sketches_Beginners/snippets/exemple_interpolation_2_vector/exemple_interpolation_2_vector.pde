PVector pos, dest;

void setup() {
  size(800, 600);
  pos = new PVector(width/2, height/2);
  dest = pos.get();
  smooth();
}

void mouseDragged() {
  dest.x = mouseX;
  dest.y = mouseY;
}

void mousePressed() {
  dest.set(mouseX, mouseY, 0);
}

void keyPressed() {
  float m = 30;
  dest.x = random(m, width - m);
  dest.y = random(m, height - m);
}

void draw() {
  background(255);

  PVector v = PVector.sub(dest, pos);
  v.mult(0.02);
  pos.add(v);

  //
  stroke(255, 0, 0, 50);
  line(pos.x, pos.y, dest.x, dest.y);

  stroke(255, 0, 0);
  v.mult(10);
  line(pos.x, pos.y, pos.x + v.x, pos.y + v.y);

  
  //pos
  noStroke();
  fill(255, 0, 0);
  ellipse(pos.x, pos.y, 17, 17);

  //dest
  noFill();
  stroke(255, 0, 0);
  ellipse(dest.x, dest.y, 25, 25);
  

}

