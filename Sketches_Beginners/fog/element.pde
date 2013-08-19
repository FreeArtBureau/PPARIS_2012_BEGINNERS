class Elemento {
  float x, y, z;
  float w, h;
  float s;
  PImage tex;
  
  Elemento(float px, float py, float pz, PImage ptex){
    x = px;
    y = py;
    z = pz;
    tex = ptex;
    w = tex.width;
    h = tex.height;
  }
  
  void disegna(){
      pushMatrix();
      translate(x - w/2, y - h, z);
      noStroke();
      image(tex, 0, 0);
      popMatrix();
  }
}

