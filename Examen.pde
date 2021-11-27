int tre = 10, korn = 10, kod = 5;
ArrayList<Knap> knapper = new ArrayList<Knap>();
ArrayList<Dyr> dyrListe = new ArrayList<Dyr>();


void setup(){
  fullScreen();
  
  rectMode(CENTER);
  textAlign(CENTER);
  
  knapper.add(new Knap(50,50,100,100,"Resources"));
  knapper.add(new Knap(50,160,100,100,"Build"));
  knapper.add(new Knap(50,270,100,100,"Army"));
  dyrListe.add(new Dyr(400,400,50,50));

}

void draw(){
  baggrund();
  
  for(Dyr d: dyrListe){
    d.update();
    d.display();
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
}
