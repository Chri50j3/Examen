
class Cattle extends Bygning {

  Cattle(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("Cattle.png");

    dyrListe.add(new Ko(x, y, h, b)); // når man laver en indhegning, så laver den selv en ko
  }
}
