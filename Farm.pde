
class Farm extends Bygning {

  Farm(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("Farm.png");
  }

  void update() {
    super.update();
    fill(255,200,0);
    noStroke();
    rect(lokation.x, lokation.y,60,60);
    stroke(0);
    if (frameCount % 300 == 0){
      korn++;
    }
  }
}
