float[] numeros;

void setup(){
  //lecture du fichier
  String[] data = loadStrings("data.txt");

  //conversion de text en floats
  numeros = new float[data.length];  
  for (int i=0; i<data.length; i++){
    numeros[i] = float(data[i]);
  }  
  
  //output
  println("-------------------------");
  println(data.length + " lignes");
  println();  
  for (int i=0; i<numeros.length; i++){
    println("["+i+"] "+numeros[i]);
  }
  
}
