ArrayList <Dot> crowd;

void setup() {
  size(800, 600);
  smooth();

  crowd = new ArrayList<Dot>();

  for (int i=0; i<30; i++) {
    float r = random(255);
    float g = random(255);
    float b = random(255);    
    Dot d = new Dot(color(r, g, b));
    crowd.add(d);
  }

  for (int i=0; i<crowd.size()-1; i++) {
    Dot d1 = crowd.get(i);
    Dot d2 = crowd.get(i+1);
    d1.pos = d2.dest;
  }
}

void mouseDragged() {
  crowd.get(0).dest.set(mouseX, mouseY, 0);
}


void keyPressed() {
  for (Dot d : crowd) {
    d.dest.set(random(width), random(height), 0);
  }
}

void draw() {
  background(255);

  for (Dot d : crowd) {
    d.bouge();
    d.affiche();
  }
}

