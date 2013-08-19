void setup() {
  size(800, 600, P3D);
}


void draw() {
  background(0);
  stroke(255);

  translate(width/2, height/2);
  //rotateX(mouseY * 0.01);
  rotateX(0.95);
  rotateZ(mouseX * 0.01);  

  int num = 250;
  float space = 4;
  float eau = 80;
  float ext = 200;
  float scal = 0.02;
  float offset = (num-1) * space / 2;
  for (int j=0; j<num; j++) {  
    for (int i=0; i<num; i++) {  
      float x = space*i - offset;
      float y = space*j - offset;
      float z = noise(i*scal + frameCount * 0.01, j*scal) * ext;
      
      if (z < eau) {
        z = eau;
        stroke(0,200,255);
      }else{
        stroke(255);
      }
      
      point(x, y, z);
    }
  }
}

