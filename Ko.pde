
class Ko extends Dyr {

  Ko(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("ko.png");
  }

  void update() {
    super.update();
    if (frameCount % 300 == 0){
      korn--;
      kod++;
    }
    if (korn<0){
      korn = 0;
      dyrListe.remove(this);
    }
  }
}
