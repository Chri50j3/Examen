int tre = 10, korn = 10, kod = 5;
ArrayList<Knap> knapper = new ArrayList<Knap>();
ArrayList<Dyr> dyrListe = new ArrayList<Dyr>();
ArrayList<Hus> bygninger = new ArrayList<Hus>();
ArrayList<Tre> trer = new ArrayList<Tre>();


boolean select = false;

void setup(){
  fullScreen();
  
  rectMode(CENTER);
  textAlign(CENTER);
  imageMode(CENTER);
  
  knapper.add(new Knap(50,50,100,100,"Resources"));
  knapper.add(new Knap(50,160,100,100,"Build"));
  knapper.add(new Knap(50,270,100,100,"Army"));
  dyrListe.add(new Ko(400,400,70,70));
  
  for(int i = 0; i < 10; i++){
    trer.add(new Tre(i*70+35,14*70+35,70,70));
  }

}

void draw(){
  baggrund();
  
  for(Dyr d: dyrListe){
    d.update();
    d.display();
  }
  for(Hus d: bygninger){
    d.update();
    d.display();
  }
  for(Tre d: trer){
    int i = trer.size();
    d.update();
    d.display();
    if(i != trer.size())
      break;
  }
  
  
  UI();
}

void baggrund(){
  strokeWeight(1);
  int i = 0;
  background(45, 122, 66);
  while(i < width){
  line(i,0,i,height);
  line(0,i,width,i);
  i+=70;
  }
}

void UI(){
  
  for(Knap k: knapper){
    k.display();
    k.update();
  }
  
  if(select){
    fill(255,200,0,200);
    rect(int(mouseX/70)*70+35,int(mouseY/70)*70+35,70,70);
  }
  
}

void mousePressed(){
  for(Dyr d: dyrListe){
    if(d.cliked == true && d.idele == true){
      d.cliked = false;
    }
  }
  for(Knap k: knapper){
    if(k.cliked == true){
      k.cliked = false;
    }
  }
  
  if(select){
    if(tre>4)
      bygninger.add(new Hus(int(mouseX/70)*70+35,int(mouseY/70)*70+35,70,70));
    select = false;
  }
  
}
