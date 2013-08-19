import processing.opengl.*;

int mode;
PVector v1, v2, v3;
float r1, r2;
float d1, d2;

void setup() {
  size(screenWidth, screenHeight, OPENGL);
  sphereDetail(100);
  smooth();
  background(128);
  mode = 0;
  randomize();
}

void mousePressed() {
  randomize();
}

void randomize() {
  background(128);
  mode = (mode + 1) % 3;
  v1 = new PVector(random(0.01, 0.02), random(0.01, 0.02), random(0.01, 0.02));
  v2 = new PVector(random(0.01, 0.04), random(0.01, 0.04), random(0.01, 0.04));
  v3 = new PVector(random(0.01, 0.04), random(0.01, 0.04), random(0.01, 0.04));
  r1 = random(50, 300);
  r2 = random(50, 300);
  d1 = random(10, 50);
  d2 = random(10, 50);
}

void draw() {
  //background(255);
  //lights();
  noCursor();
  translate(width/2, height/2);

  rotateX(frameCount * v1.x);  
  rotateY(frameCount * v1.y);
  rotateZ(frameCount * v1.z);

  translate(r1, 0, 0);
  fill(255);
  noStroke();  
  //sphere(d1);

  rotateX(frameCount * v2.x);  
  rotateY(frameCount * v2.y);
  rotateZ(frameCount * v2.z);


  translate(r2, 0, 0);
  if (mode == 0) {
    float r = (sin(frameCount * v3.x) + 1) * 127.5;
    float g = (sin(frameCount * v3.y) + 1) * 127.5;
    float b = (sin(frameCount * v3.z) + 1) * 127.5;
    fill(r, g, b);
  } 
  else if (mode == 1) {
    if (frameCount/4 % 2 == 0) {
      fill(0);
    }
    else {
      fill(255);
    }
  } 
  else if (mode == 2) {
    float r = random(0, 255);
    float g = random(0, 255);
    float b = random(0, 255);
    fill(r, g, b);
  }

  float rad = sin(frameCount*0.076) * d2 + d2 + 10;
  sphere(rad);
  
  if (frameCount % 1000 == 0) {
    String file = year() + "-" + month() + "-" + day() + "-" + hour() + "-" + minute() + "-" + second();
    file = "out/out-" + file + ".png";
    save(file);
    randomize();
  }
  
}

