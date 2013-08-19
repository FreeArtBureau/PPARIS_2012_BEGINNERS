PImage drop1, drop2;

void setup() {
  size(700, 500);
  drop1 = loadImage("ink1_trash.png"); //image avec mouvais alpha!
  drop2 = loadImage("ink2_blanc.png"); //image avec alpha correct, corrigé en photoshop

  println("taille horizontale: " + drop1.width);
  println("taille verticale: " + drop1.height);
  
  imageMode(CENTER); //alignement de l'image par rapport au centre
  //imageMode(CORNER); //alignement de l'image par rapport au coin (default)
}

void draw() {
  background(128);

  noTint();
  image(drop1, 120, 120);

  tint(255,0,0);
  image(drop2, 330, 220);

  tint(255,120,0, 200);
  image(drop2, 430, 220);

  tint(255,0,255, 200);
  image(drop2, 330, 320);

  tint(0,255,120, 200);
  image(drop2, mouseX, mouseY);

}

