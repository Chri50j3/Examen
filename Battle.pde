void battleStart(int enemys){
  for(int i =0;i<enemys;i++){
    soldater.add(new Soldat(random(0,width/2),random(0,height),70,70,false));
  }
}

void tegnBattle(){
  baggrund();
  
  for(Soldat r:soldater){
    int i = soldater.size();
    r.update();
    r.display();
    if (i != soldater.size())
      break;
  }
  
}
