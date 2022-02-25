
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
      if (r.ven!=ven) {
        won = false;
        if (dist > dist(lokation.x, lokation.y, r.lokation.x, r.lokation.y)) {
          dist = dist(lokation.x, lokation.y, r.lokation.x, r.lokation.y);
          findVej.set(r.lokation.x, r.lokation.y);
        }
      }
    }
    if (dist(lokation.x, lokation.y, findVej.x, findVej.y)>20) {
      speed.set(findVej.x-lokation.x, findVej.y-lokation.y);
      speed.setMag(topSpeed);
    } else if (!won) {
      speed.setMag(0);
      HP -= int(random(0, hpVarians));
    }
    lokation.add(speed);

    if (won) {
      String tekst = "";
      if (ven) {
        tekst = "You Won!";
        tre += int(random(0, 1));
        kod += int(random(0, 1));
        sten += int(random(0, 1));
        korn += int(random(0, 1));
      } else if (!ven)
        tekst = "You Lost!";
      textSize(200);
      text(tekst, width/2, height/2);
    }

    if (won && mousePressed) {
      battleEnd();
    }
  }
}
