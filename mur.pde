
class Mur extends Bygning{

   Mur(float x, float y, float b, float h) {
    super(x, y, b, h);
    switch(rotateNr){
      case 0:
        billede = loadImage("Mur1.png");
        break;
      case 1:
        billede = loadImage("Mur2.png");
        break;
      case 2:
        billede = loadImage("Mur1.png");
        break;
      case 3:
        billede = loadImage("Mur2.png");
        break;
      default:
        billede = loadImage("Mur1.png");
    }
    sten -=5;
  } 
}
