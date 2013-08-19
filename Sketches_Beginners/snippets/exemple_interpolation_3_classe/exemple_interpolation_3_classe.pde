Dot john, james;

void setup() {
  size(800, 600);
  smooth();
  
  john = new Dot(color(255,0,0));
  james = new Dot(color(255,200,0));

}

void mousePressed() {
  keyPressed();
}

void keyPressed() {
  john.dest.set(random(width),random(height),0);
  james.dest.set(random(width),random(height),0);
}

void draw() {
  background(255);
  john.bouge();
  james.bouge();

  john.affiche();
  james.affiche();
}

