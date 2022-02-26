
class Ko extends Dyr {

  Ko(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("ko.png");
    edgeOut.set(x+10, y+10); // Hvis koen er mere end 10 pixels væk fra der hvor den starter, så vender den om
    edgeIn.set(x-10, y-10);
  }

  void update() {
    super.update();
    if (frameCount % 300 == 0) {
      korn--;
      kod++;
    }
    if (korn<0) {
      korn = 0;
      dyrListe.remove(this);
    }
  }
}
