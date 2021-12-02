
class Hus extends Bygning {

  Hus(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("hus.png");
    dyrListe.add(new Person(x, y, h, b));
  }
}
