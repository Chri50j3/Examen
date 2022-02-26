
class Hus extends Bygning {

  Hus(float x, float y, float b, float h) {
    super(x, y, b, h);
    switch(rotateIndex) { // vælger et billede baseret på rotationen af bygningen
    case 0:
      billede = loadImage("hus.png");
      break;
    case 1:
      billede = loadImage("hus270.png");
      break;
    case 2:
      billede = loadImage("hus180.png");
      break;
    case 3:
      billede = loadImage("hus90.png");
      break;
    default:
      billede = loadImage("hus.png");
    }

    dyrListe.add(new Person(x, y, h, b));
    dyrListe.add(new Person(x, y, h, b));
  }
}
