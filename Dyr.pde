
class Dyr extends Objekt {
  PVector speed = new PVector(0, 0);
  PVector edgeOut = new PVector(width-50, height-50);
  PVector edgeIn = new PVector(50, 50);
  boolean idele = true; 
  float topSpeed = 0.2;
  int updateFrame = int(random(100,150));

  Dyr(float x, float y, float b, float h) {
    super(x, y, b, h);
  }

  void update() {
    super.update();
    if (clicked == false && idele == true) {
      if (frameCount % updateFrame == 0) {
        speed.set(random(-topSpeed, topSpeed), random(-topSpeed, topSpeed)); // hvert 120. fram så går dyr en tilfældig retning, hvis dyret er uden for dets grænser så går det ikke længere den vej

        if (lokation.x < edgeIn.x)
          speed.x=random(0, topSpeed);
        else if (lokation.x > edgeOut.x)
          speed.x=random(-topSpeed, 0);
        if (lokation.y < edgeIn.y)
          speed.y=random(0, topSpeed);
        else if (lokation.y > edgeOut.y)
          speed.y=random(-topSpeed, 0);
      }
    }
    lokation.add(speed);
  }

  void display() { // rotere billedet så det passer til den retning som dyret gå
    push();
    translate(lokation.x, lokation.y);
    rotate(PI+speed.heading());
    super.display();
    pop();
  }

  void hukTre() {
  }
}
