
class Tre extends Objekt {
  int health = 5;

  Tre(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("tre.png");
  }

  void update() {
    super.update();
  }

  void huk() {
    tre++;
    health--;
  }
}
