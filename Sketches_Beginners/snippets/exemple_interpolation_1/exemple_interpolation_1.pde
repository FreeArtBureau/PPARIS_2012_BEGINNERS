float posX, posY;
float destX, destY;

void setup() {
  size(800, 600);
  posX = width/2;
  posY = height/2;
  destX = posX;
  destY = posY;
  smooth();
}

void mouseDragged(){
  destX = mouseX;
  destY = mouseY;
}

void mousePressed(){
  destX = mouseX;
  destY = mouseY;
}

void keyPressed(){
  float m = 30;
  destX = random(m, width - m);
  destY = random(m, height - m);

}

void draw() {
  background(255);
  
  posX += (destX - posX) * 0.02;
  posY += (destY - posY) * 0.02;

  //
  stroke(255,0,0,100);
  line(posX, posY, destX, destY);
  
  //pos
  noStroke();
  fill(255,0,0);
  ellipse(posX, posY, 17, 17);
  
  //dest
  noFill();
  stroke(255,0,0);
  ellipse(destX, destY, 25, 25);
  
  
}

