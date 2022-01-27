void battleStart(int enemys) {
  for (int i =0; i<enemys; i++) {
    soldater.add(new Soldat(random(0, width/2), random(0, height), 70, 70, false));
  }
  for (Dyr r : dyrListe) {
    if (r instanceof Person == true)
      soldater.add(new Soldat(random(width/2, width), random(0, height), 70, 70, true));
  }
}

void tegnBattle() {
  baggrund();
  for (Soldat r : soldater) {
    if(r.HP<=0){
      soldater.remove(r);
      break;
    }  
  }
  
  for (Soldat r : soldater) {
    int i = soldater.size();
    r.update();
    r.display();
    if (i != soldater.size())
      break;
  }
}

void battleEnd() {
  soldater.clear();
  scene = 2;
}
