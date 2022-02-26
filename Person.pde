
class Person extends Dyr {
  PVector findVej = new PVector(0, 0);
  boolean hukker = false;
  Tre hukTreet;

  Person(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("mand.png");

    if (this instanceof Soldat == false) {
      borgere ++;
      hukTre();
    }
  }

  void update() {
    super.update();
    topSpeed = 12/frameRate; // personer bevæger sig med 12 pixels i sekundet, lige meget hvad frameraten er
    if (frameCount%650 == 0) {
      kod--;
    }

    if (!idele && !hukker)
      walk();

    if (hukker && frameCount%300 == 0 && hukTreet != null) {
      if (hukTreet.health<1) { // ser om træet er blevet fældet
        hukTreet.health--;
        hukTreet = null;
        hukker = false;
        idele = true;
        hukTre();
      } else
        hukTreet.huk();
    }   
    if (kod<0) {
      kod = 0;
      dyrListe.remove(this);
      borgere--;
    }
  }

  void hukTre() {
    float dist = 10000;
    Tre dd = null;
    for (Tre d : trer) { // finder det træ der er tætest på
      if (dist > dist(lokation.x, lokation.y, d.lokation.x, d.lokation.y) && !d.isHuk) {
        dist = dist(lokation.x, lokation.y, d.lokation.x, d.lokation.y);
        findVej.set(d.lokation.x, d.lokation.y); // find vej bliver sat til træets koordinater og personen går over mod de koordinater
        hukTreet = d;
        dd = d;
      }
    }
    if (dd != null) {
      idele = false;
      dd.isHuk = true;
    }
  }

  void walk() {
    if (!idele) {
      if (!findVej()) {
        speed.setMag(0);
        hukker = true;
      }
    }
  }
  boolean findVej() {
    if (dist(lokation.x, lokation.y, findVej.x, findVej.y)>30) {
      speed.set(findVej.x-lokation.x, findVej.y-lokation.y); // laver en vektor fra personens position til træets position, og sætter længden af vektoren til at være topfarten
      speed.setMag(topSpeed);
    } else
      return false;
    return true;
  }
}
