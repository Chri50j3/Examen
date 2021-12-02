
class Cattle extends Bygning {

  Cattle(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("hus.png");

    dyrListe.add(new Ko(x, y, h, b));
  }
}
