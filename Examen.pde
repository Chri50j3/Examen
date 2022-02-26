int tre = 15, korn = 10, kod = 5, sten = 0;
ArrayList<Knap> knapper = new ArrayList<Knap>();
ArrayList<Dyr> dyrListe = new ArrayList<Dyr>();
ArrayList<Bygning> bygninger = new ArrayList<Bygning>();
ArrayList<Objekt> jordByg = new ArrayList<Objekt>();
ArrayList<Tre> trer = new ArrayList<Tre>();
ArrayList<Knap> BuildKnapper = new ArrayList<Knap>();
ArrayList<Soldat> soldater = new ArrayList<Soldat>();

boolean select = false, fri = true, tutorial = true;
String bygningType;
int scene = 1, borgere = 0, lastScene = 1;
String byNavn = "Your town";
float rotate = PI*100;
int rotateIndex = 0;

int sqareX, sqareY;
PImage kort, by, slot, BG, mouse;

void setup() {
  frameRate(120);
  fullScreen();

  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);

  kort = loadImage("kort.png");
  by = loadImage("By.png");
  slot = loadImage("Slot.png");
  BG = loadImage("BG.png");
  mouse = loadImage("mus.png");

  knapper.add(new Knap(80, 70, 120, 80, "Resources"));
  knapper.add(new Knap(80, 160, 120, 80, "Build"));
  knapper.add(new Knap(80, 250, 120, 80, "Army"));

  buildKeys();

  for (int i = 0; i < 10; i++) {
    trer.add(new Tre(int(random(1, 27))*70+35, int(random(1, 15))*70+35, 70, 70));
  }
}

void draw() {
  cursor(mouse, 0, 0);
  //tegner kun den scene som skal vises, de andre bliver ikke kørt og er dermed "på pause"
  switch(scene) {
  case 1:
    tegnBy();
    break;
  case 2:
    tegnKort();
    break;
  case 3:
    tegnBattle();
    break;
  default:
    clear();
    fill(200);
    textSize(70);
    text("GAME PAUSED", width/2, height/2);
    textSize(50);
    text("Press Alt+F4 to close game", width/2, height/2+220);
  }
}

void mousePressed() {
  for (Knap k : BuildKnapper) {
    if (k.clicked == true) {
      k.clicked = false;
    }
  }

  if (select) {
    if (fri && sten>1) {
      if (bygningType.equals("Gravel"))
        jordByg.add(new Sti(int(mouseX/70)*70+35, int(mouseY/70)*70+35));
      if (bygningType.equals("Wall") && sten>4)
        bygninger.add(new Mur(int(mouseX/70)*70+35, int(mouseY/70)*70+35, 70, 70));
    }
    if (tre>4 && fri)
      if (bygningType.equals("House"))
        bygninger.add(new Hus(int(mouseX/70)*70+35, int(mouseY/70)*70+35, 70, 70));
      else if (bygningType.equals("Farm"))
        jordByg.add(new Farm(int(mouseX/70)*70+35, int(mouseY/70)*70+35, 70, 70));
      else if (bygningType.equals("Cattle"))
        bygninger.add(new Cattle(int(mouseX/70)*70+35, int(mouseY/70)*70+35, 70, 70));
      else if (bygningType.equals("Mine"))
        bygninger.add(new Mine(int(mouseX/70)*70+35, int(mouseY/70)*70+35, 70, 70));

    select = false;
  }
}

void keyPressed() {
  if (keyCode==ESC) {
    if (scene != 0) {
      lastScene = scene;
      scene = 0;
    } else if (scene==0) {
      scene = lastScene;
    }
  }

  if (key==',') {
    rotate-=PI/2;
  }
  if (key=='.') {
    rotate+=PI/2;
  }
  rotateIndex = round(abs((rotate/(PI*2)*4)%4)); // laver en vinkel om til en int mellem 0 og 3 så jeg ved hvilket billede der skal bruges under bygningerne

  key=0; // gør så spillet ikke bare lukker ned når man trykker ESC
}

void buildKeys() {
  BuildKnapper.add(new Knap(220, 200, 70, 70, "House", true));
  BuildKnapper.add(new Knap(220, 300, 70, 70, "Farm", true));
  BuildKnapper.add(new Knap(220, 400, 70, 70, "Cattle", true));
  BuildKnapper.add(new Knap(220, 500, 70, 70, "Mine", true));
  BuildKnapper.add(new Knap(220, 600, 70, 70, "Gravel", true, "2 Stone"));
  BuildKnapper.add(new Knap(220, 700, 70, 70, "Wall", true, "5 Stone"));
}
