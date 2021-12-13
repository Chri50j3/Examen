
class Tre extends Objekt {
  int health = 5;
  boolean isHuk = false;

  Tre(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("tre.png");
  }

  void update() {
    super.update();
    if(health<0){
      trer.remove(this);
    }
  }

  void huk() {
    tre++;
    health--;
  }
}
