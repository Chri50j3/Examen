
class Farm extends Bygning {

  Farm(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("hus.png");
  }

  void update() {
    super.update();
    if (frameCount % 300 == 0){
      korn++;
    }
  }
}
