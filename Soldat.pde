
class Soldat extends Person {
  boolean ven;
  int HP = 100;
  int hpVarians;

  Soldat(float x, float y, float b, float h, boolean ven_) {
    super(x, y, b*3, h*3);
    ven = ven_;

    if (ven) {
      billede = loadImage("SoldatBlå.png"); 
      hpVarians = 2;
    } else {
      billede = loadImage("SoldatRød2.png"); 
      hpVarians = 3;
    }
    idele=false;
    topSpeed = topSpeed*10;
  }

  void update() {
    float dist = 10000;
    boolean won = true;
    for (Soldat r : soldater) {
      if (r.ven!=ven) { // finder den fjender, der er tætest på
        won = false;
        float tempDist = dist(lokation.x, lokation.y, r.lokation.x, r.lokation.y);
        if (dist > tempDist) {
          dist = tempDist;
          findVej.set(r.lokation.x, r.lokation.y);
        }
      }
    }
    if (findVej()) {
    } else if (!won) {
      speed.setMag(0);
      HP -= int(random(0, hpVarians)); // fjender tager mere skade end venner, for at gøre det lidt sjovere for spilleren
    }
    lokation.add(speed);

    if (won) {
      String tekst = "";
      if (ven) {
        tekst = "You Won!";
      } else if (!ven)
        tekst = "You Lost!";
      textSize(200);
      text(tekst, width/2, height/2);
    }

    if (won && mousePressed) {
      battleEnd(won);
    }
  }
}
