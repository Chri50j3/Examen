
class Hus extends Objekt {

  Hus(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("hus.png");

    tre -= 5;

    dyrListe.add(new Person(x, y, h, b));
  }

  void update() {
    super.update();
  }
}
