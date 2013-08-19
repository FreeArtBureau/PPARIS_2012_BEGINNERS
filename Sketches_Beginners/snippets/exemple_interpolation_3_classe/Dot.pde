class Dot {
  PVector pos, dest, v;
  color col;

  Dot(color c) {
    col = c;
    float m = 40;
    pos = new PVector(random(m, width-m), random(m, height-m));
    dest = pos.get();
  }

  void affiche() {
    stroke(col, 50);
    line(pos.x, pos.y, dest.x, dest.y);

    stroke(col);
    v.mult(10);
    line(pos.x, pos.y, pos.x + v.x, pos.y + v.y);

    //pos
    noStroke();
    fill(col);
    ellipse(pos.x, pos.y, 17, 17);

    //dest
    noFill();
    stroke(col);
    ellipse(dest.x, dest.y, 25, 25);
  }

  void bouge() {
    v = PVector.sub(dest, pos);
    v.mult(0.02);
    pos.add(v);
  }
}

