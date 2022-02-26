
class Sti extends Objekt {

  int rotate;

  Sti(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("Sti.png");
    rotate = int(random(0, 4));
    sten -=2;
  }

  Sti(float x, float y) {
    super(x, y, 70, 70);
    billede = loadImage("Sti.png");
    rotate = int(random(0, 4));
    sten -=2;
  }

  void display() {
    push();
    translate(lokation.x, lokation.y);
    rotate(rotate*(PI/2));
    image(billede, 0, 0, size.x, size.y);
    pop();
  }
}
