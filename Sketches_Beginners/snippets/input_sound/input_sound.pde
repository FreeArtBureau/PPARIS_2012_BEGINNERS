import ddf.minim.*;

Minim minim;
AudioInput in;
float left, right;

void setup() {
  size(800,600);

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 512);
}

void draw() {
  background(255);
  
  float ml = 0;
  float mr = 0;
  
  stroke(0);
  for (int i=0; i<in.bufferSize()-1; i++) {
    float l = in.left.get(i);
    float r = in.right.get(i);
    ml += abs(l);
    mr += abs(r);
    point(i, height/2 - 50 + l * 150);
    point(i, height/2 + 50 + r * 150);
  }
  
  ml = ml / in.bufferSize();
  mr = mr / in.bufferSize(); 
  
  left += (ml - left) * 0.05;
  right += (mr - right) * 0.05;  
  
  noStroke();
  fill(255,0,0);
  rect(0, 0, left * 10000, 10);
  rect(0, 10, ml * 10000, 10);

  fill(0,0,255);
  rect(0,height-10, right * 10000, 10);
}

void stop() {
  in.close();
  minim.stop();  
  super.stop();
}

