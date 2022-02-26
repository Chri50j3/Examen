
class Mine extends Bygning {

  Mine(float x, float y, float b, float h) {
    super(x, y, b, h);
    switch(rotateIndex) {
    case 0:
      billede = loadImage("Mine.png");
      break;
    case 1:
      billede = loadImage("Mine270.png");
      break;
    case 2:
      billede = loadImage("Mine180.png");
      break;
    case 3:
      billede = loadImage("Mine90.png");
      break;
    default:
      billede = loadImage("Mine.png");
    }
  }

  void update() {
    super.update();
    if (frameCount % 500 == 0) {
      sten++;
    }
  }
}
