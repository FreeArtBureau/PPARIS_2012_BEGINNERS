void setup(){
 size(800,600); 
  smooth();
}

void draw(){
  background(255);
  
  translate(width/2, height/2);

  stroke(220);
  line(-width/2,0,width/2,0);
  line(0,-height/2,0,height/2);
  
  float r = mouseY;
  float a = mouseX * 0.01;
  
  float x = cos(a) * r;
  float y = sin(a) * r;  
  
  stroke(255,0,0);
  line(0,0,x,y);
  noStroke();
  fill(255,0,0);
  ellipse(x,y,10,10);
  ellipse(0,0,10,10);
  
}
