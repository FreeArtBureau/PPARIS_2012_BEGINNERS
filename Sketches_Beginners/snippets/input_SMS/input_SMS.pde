/*
example de input avec SuddenMoationSensor 
avec lissage du bruit
marche seulement sur macintosh
depend de la librairie SMS
*/
import sms.*;
float ex, ey;

void setup() {
  size(800,600);
  
}

void draw() {
  background(255);
  float x = Unimotion.getSMSX();
  float y = Unimotion.getSMSY();
  float z = Unimotion.getSMSZ();
  
  ex += (width/2 + x - ex) * 0.03;
  ey += (height/2 - y - ey) * 0.03; 
  stroke(0);
  line(0, ey, width, ey);
  line(ex, 0, ex, height); 

  float rx = width/2 + x;
  float ry = height/2 - y;  
  stroke(255,0,0);
  line(0, ry, width, ry);
  line(rx, 0, rx, height); 

}

