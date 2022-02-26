
class Objekt {
  PVector lokation;
  PVector size;
  PImage billede;
  boolean clicked = false;
  float frame;

  Objekt(float x, float y, float b, float h) {
    lokation = new PVector(x, y);
    size = new PVector(b, h);
  }

  void update() {
    if (frameCount>frame) // gør så der er et lille delay mellem at man trykker, så man ikke kommer til at trykke to gange ved en fejl
      mouseCheck();
  }

  void mouseCheck() {
    if (abs(mouseX-lokation.x)<size.x/2 && abs(mouseY-lokation.y)<size.y/2 && mousePressed) {
      clicked = !clicked;
      frame = frameCount+10;
    }
  }

  void display() {
    if (this instanceof Dyr) {
      image(billede, 0, 0, size.x, size.y); // dyr har koordinaterne 0,0 fordi jeg translater til deres koordinater når jeg rotere dem
    } else
      image(billede, lokation.x, lokation.y, size.x, size.y);
  }
}
