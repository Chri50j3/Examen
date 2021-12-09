
void tegnBy(){
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

  fri = checkFri(mouseX,mouseY);
  UI();
  
  if(frameCount%1000 == 0){
    for (int i = 0; i < 3; i++) {
      float x = int(random(1, 27))*70+35;
      float y = int(random(1, 15))*70+35;
      if(checkFri(x,y))
        trer.add(new Tre(x, y, 70, 70));
    }
  }
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

boolean checkFri(float x,float y) {

  for (Bygning d : bygninger) {
    if (dist(int(x/70)*70+35, int(y/70)*70+35, d.lokation.x, d.lokation.y)<1)
      return false;
  }
  for (Tre d : trer) {
    if (dist(int(x/70)*70+35, int(y/70)*70+35, d.lokation.x, d.lokation.y)<1)
      return false;
  }
  return true;
}
