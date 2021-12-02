int tre = 10, korn = 10, kod = 5;
ArrayList<Knap> knapper = new ArrayList<Knap>();
ArrayList<Dyr> dyrListe = new ArrayList<Dyr>();
ArrayList<Bygning> bygninger = new ArrayList<Bygning>();
ArrayList<Tre> trer = new ArrayList<Tre>();
ArrayList<Knap> BuildKnapper = new ArrayList<Knap>();

boolean select = false, fri = true;
String bygningType;

void setup() {
  frameRate(60);
  fullScreen();

  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);

  knapper.add(new Knap(50, 50, 100, 100, "Resources"));
  knapper.add(new Knap(50, 160, 100, 100, "Build"));
  knapper.add(new Knap(50, 270, 100, 100, "Army"));
  dyrListe.add(new Ko(400, 400, 70, 70));

  buildKeys();

  for (int i = 0; i < 10; i++) {
    trer.add(new Tre(int(random(1, 14))*70+35, int(random(1, 14))*70+35, 70, 70));
  }
}

void draw() {
  baggrund();

  for (Dyr d : dyrListe) {
    int i = dyrListe.size();
    d.update();
    d.display();
    if (i != dyrListe.size())
      break;
  }
  for (Bygning d : bygninger) {
    int i = bygninger.size();
    d.update();
    d.display();
    if (i != bygninger.size())
      break;
  }
  for (Tre d : trer) {
    int i = trer.size();
    d.update();
    d.display();
    if (i != trer.size())
      break;
  }

  fri = checkFri();
  UI();
}

void baggrund() {
  strokeWeight(1);
  int i = 0;
  background(45, 122, 66);
  while (i < width) {
    line(i, 0, i, height);
    line(0, i, width, i);
    i+=70;
  }
}

void UI() {

  for (Knap k : knapper) {
    k.display();
    k.update();
  }

  if (select) {
    if (fri)
      fill(255, 200, 0, 200);
    else if (!fri) 
      fill(255, 0, 0, 200);
    rect(int(mouseX/70)*70+35, int(mouseY/70)*70+35, 70, 70);
  }
}

boolean checkFri() {

  for (Bygning d : bygninger) {
    if (dist(int(mouseX/70)*70+35, int(mouseY/70)*70+35, d.lokation.x, d.lokation.y)<1)
      return false;
  }
  for (Tre d : trer) {
    if (dist(int(mouseX/70)*70+35, int(mouseY/70)*70+35, d.lokation.x, d.lokation.y)<1)
      return false;
  }
  return true;
}

void mousePressed() {
  for (Dyr d : dyrListe) {
    if (d.cliked == true && d.idele == true) {
      d.cliked = false;
    }
  }
  for (Knap k : BuildKnapper) {
    if (k.cliked == true) {
      k.cliked = false;
    }
  }

  if (select) {
    if (tre>4 && fri)
      if (bygningType.equals("House"))
        bygninger.add(new Hus(int(mouseX/70)*70+35, int(mouseY/70)*70+35, 70, 70));
      else if (bygningType.equals("Farm"))
        bygninger.add(new Farm(int(mouseX/70)*70+35, int(mouseY/70)*70+35, 70, 70));
      else if (bygningType.equals("Cattle"))
        bygninger.add(new Cattle(int(mouseX/70)*70+35, int(mouseY/70)*70+35, 70, 70));

    select = false;
  }
}

void keyPressed() {
  for (Dyr d : dyrListe) {
    d.hukTre();
  }
}

void buildKeys() {
  BuildKnapper.add(new Knap(250, 200, 70, 70, "House"));
  BuildKnapper.add(new Knap(250, 300, 70, 70, "Farm"));
  BuildKnapper.add(new Knap(250, 400, 70, 70, "Cattle"));
}
