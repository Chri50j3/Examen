
class Objekt {
  PVector lokation;
  PVector size;
  PImage billede;
  boolean cliked = false;
  float frame;

  Objekt(float x, float y, float b, float h) {
    lokation = new PVector(x, y);
    size = new PVector(b, h);
  }

  void update() {
    if(frameCount>frame)
      mouseCheck();
  }

  void mouseCheck() {
    if (abs(mouseX-lokation.x)<size.x/2 && abs(mouseY-lokation.y)<size.y/2 && mousePressed) {
      cliked = !cliked;
      frame = frameCount+10;
    }
  }

  void display() {
    image(billede, lokation.x, lokation.y, size.x, size.y);
  }
}
