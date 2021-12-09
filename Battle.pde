
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
