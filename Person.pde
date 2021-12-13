
class Person extends Dyr {
  PVector findVej = new PVector(0, 0);
  boolean hukker = false;
  Tre hukTreet;

  Person(float x, float y, float b, float h) {
    super(x, y, b, h);
    billede = loadImage("mand.png");
    
    if(this instanceof Soldat == false){
      soldater.add(new Soldat(random(width/2,width),random(0,height),70,70,true));
      hukTre();
    }

  }

  void update() {
    super.update();
    
    if(frameCount%650 == 0){
      kod--;
    }

    if (!idele && !hukker)
      walk();

    if (hukker && frameCount%300 == 0) {
      if (hukTreet.health<1) {
        hukTreet.health--;;
        hukker = false;
        idele = true;
        hukTre();
      } else
        hukTreet.huk();
    }   
    if (kod<0){
      kod = 0;
      dyrListe.remove(this);
      borgere--;
      soldater.remove(0);
    }
  }

  void hukTre() {
    idele = false;
    float dist = 10000;
    Tre dd = null;
    for (Tre d : trer) {
      if (dist > dist(lokation.x, lokation.y, d.lokation.x, d.lokation.y) && !d.isHuk) {
        dist = dist(lokation.x, lokation.y, d.lokation.x, d.lokation.y);
        findVej.set(d.lokation.x, d.lokation.y);
        hukTreet = d;
        dd = d;
      }
    }
    if(dd != null)
      dd.isHuk = true;
  }

  void walk() {
    if (!idele) {
      if (dist(lokation.x, lokation.y, findVej.x, findVej.y)>30) {
        speed.set(findVej.x-lokation.x, findVej.y-lokation.y);
        speed.setMag(topSpeed);
      } else {
        speed.setMag(0);
        hukker = true;
      }
    }
  }
}
