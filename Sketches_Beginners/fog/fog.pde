
import processing.opengl.*;
import javax.media.opengl.GL;
import java.nio.FloatBuffer;

ArrayList <Elemento> elementi;
float px, py, pz;

void setup() {
  size(screenWidth, screenHeight, OPENGL);
  hint(ENABLE_DEPTH_SORT);
  hint(ENABLE_DEPTH_TEST);

  elementi = new ArrayList<Elemento>();

  ArrayList <PImage> immagini = new ArrayList<PImage>();
  for (int i=0; i<6; i++) {
    immagini.add(loadImage("albero_" + i + ".png"));
  }  

  for (int i=0; i<300; i++) {
    float x = random(-2200, 2200);
    float y = 0;
    float z = random(-2200, 2200); 
    int a = int(random(0, 6));
    elementi.add(new Elemento(x, y, z, immagini.get(a)));
  }

  Elemento lupo = new Elemento(600, 0, 600, loadImage("lupo.png"));
  elementi.add(lupo);

  Elemento r = new Elemento(random(-2200, 2200), 0, random(-2200, 2200), loadImage("r.png"));
  elementi.add(r);
  Elemento k = new Elemento(random(-2200, 2200), 0, random(-2200, 2200), loadImage("k.png"));
  elementi.add(k);
  Elemento s = new Elemento(random(-2200, 2200), 0, random(-2200, 2200), loadImage("s.png"));
  elementi.add(s);
  

  /* 
   NEBBIA
   near: da che distanza comincia la nebbia
   far: a che distanza finisce 
   density: densità della nebbia
   color: colore della nebbia (=colore di fondo?)
   */
  nebbia(0, 3000, 0.25, color(255));
}

void draw() {
  //correzione della prospettiva
  float fov = PI/2.8; 
  float cameraZ = (height/2.0) / tan(fov/2.0);
  float aspect = float(width)/float(height);
  float zNear = cameraZ/100; 
  float zFar = cameraZ*10;  
  perspective(fov, aspect, zNear, zFar); 


  background(255);
  /*
  px += (width/2 - mouseX) * 0.01;
   pz += (height/2 - mouseY) * 0.01;
   py = 0;
   */

  float px = sin(frameCount * 0.0021) * 1400;
  float pz = sin(frameCount * 0.0022) * 1400;
  float py = 400 + sin(frameCount*0.01)*180;
  translate(width/2 + px, height/2 + py, pz); 
  for (Elemento e : elementi) {
    e.disegna();
  }
}

void nebbia(float near, float far, float density, color col) {
  float[] fogColor = new float[4];
  fogColor[0] = red(col)/255.0;
  fogColor[1] = green(col)/255.0;
  fogColor[2] = blue(col)/255.0;
  fogColor[3] = alpha(col)/255.0;  

  PGraphicsOpenGL pgl = (PGraphicsOpenGL) g;
  GL gl = pgl.beginGL();
  gl.glEnable (GL.GL_FOG); 
  //gl.glFogi (GL.GL_FOG_MODE, GL.GL_EXP); //EXP2 FOG
  gl.glFogi(GL.GL_FOG_MODE, GL.GL_LINEAR); //Linear FOG
  gl.glFogf(GL.GL_FOG_START, near);
  gl.glFogf(GL.GL_FOG_END, far);

  gl.glFogfv (GL.GL_FOG_COLOR, FloatBuffer.wrap(fogColor)); 
  gl.glFogf (GL.GL_FOG_DENSITY, density); 
  gl.glHint (GL.GL_FOG_HINT, GL.GL_NICEST);
  pgl.endGL();
}

