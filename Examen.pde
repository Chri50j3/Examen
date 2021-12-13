int tre = 10, korn = 10, kod = 5;
ArrayList<Knap> knapper = new ArrayList<Knap>();
ArrayList<Dyr> dyrListe = new ArrayList<Dyr>();
ArrayList<Bygning> bygninger = new ArrayList<Bygning>();
ArrayList<Tre> trer = new ArrayList<Tre>();
ArrayList<Knap> BuildKnapper = new ArrayList<Knap>();
ArrayList<Soldat> soldater = new ArrayList<Soldat>();

boolean select = false, fri = true;
String bygningType;
int scene = 1, borgere = 0;
String byNavn = "Gammelby";
float rotate = 0;

int sqareX,sqareY;
PImage kort,by,slot;

void setup() {
  frameRate(60);
  fullScreen();

  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  
  kort = loadImage("kort.png");
  by = loadImage("By.png");
  slot = loadImage("Slot.png");

  knapper.add(new Knap(50, 50, 100, 100, "Resources"));
  knapper.add(new Knap(50, 160, 100, 100, "Build"));
  knapper.add(new Knap(50, 270, 100, 100, "Army"));

  buildKeys();

  for (int i = 0; i < 20; i++) {
    trer.add(new Tre(int(random(1, 27))*70+35, int(random(1, 15))*70+35, 70, 70));
  }
}

void draw() {
  //tegner kun den scene som skal vises, de andre er "på pause"
  switch(scene){
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
  }
}

void mousePressed() {
  for (Dyr d : dyrListe) {
    if (d.clicked == true && d.idele == true) {
      d.clicked = false;
    }
  }
  for (Knap k : BuildKnapper) {
    if (k.clicked == true) {
      k.clicked = false;
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
  if(key=='i'){
    scene++;
  }
  if(key=='u'){
    scene--;
  }
  if(key==','){
    rotate-=PI/2;
  }
  if(key=='.'){
    rotate+=PI/2;
  }
}

void buildKeys() {
  BuildKnapper.add(new Knap(250, 200, 70, 70, "House"));
  BuildKnapper.add(new Knap(250, 300, 70, 70, "Farm"));
  BuildKnapper.add(new Knap(250, 400, 70, 70, "Cattle"));
}
