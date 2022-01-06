
void tegnBy() {
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

  fri = checkFri(mouseX, mouseY); // checker om det fælt som du vil bygge i er frit
  UI();

  if (frameCount%1000 == 0) {
    for (int i = 0; i < 1; i++) {
      float x = int(random(1, 27))*70+35;
      float y = int(random(1, 15))*70+35;
      if (checkFri(x, y))
        trer.add(new Tre(x, y, 70, 70));
    }
  }
}

void baggrund() {
  strokeWeight(1);
  background(45, 122, 66);
  image(BG, width/2, height/2);
  fill(45, 122, 66, 100);
  rect(width/2, height/2, width, height);

  if (scene == 1) {
    for (Objekt d : jordByg) {
      int y = jordByg.size();
      d.update();
      d.display();
      if (y != jordByg.size())
        break;
    }
  }
}

void UI() {
  fill(45, 122, 66, 10);
  rect(width/2, height/2, width, height);

  if (select) {
    int i = 0;
    while (i < width) {
      line(i, 0, i, height);
      line(0, i, width, i);
      i+=70;
    }

    sqareX = int(mouseX/70)*70+35;
    sqareY = int(mouseY/70)*70+35;

    if (fri)
      fill(255, 200, 0, 200);
    else if (!fri) 
      fill(255, 0, 0, 200);
    rect(sqareX, sqareY, 70, 70);
    push();
    translate(sqareX, sqareY);
    rotate(rotate);
    stroke(255, 255, 255, 200);
    fill(255, 255, 255, 200);
    strokeWeight(5);
    line(-20, 0, +20, 0);
    triangle(0-25, 0, 0-15, 0-10, 0-15, 0+10);
    pop();
    stroke(0);
  }

  for (Knap k : knapper) {
    k.display();
    k.update();
  }
}

boolean checkFri(float x, float y) {

  for (Bygning d : bygninger) {
    if (dist(int(x/70)*70+35, int(y/70)*70+35, d.lokation.x, d.lokation.y)<1)
      return false;
  }
  for (Tre d : trer) {
    if (dist(int(x/70)*70+35, int(y/70)*70+35, d.lokation.x, d.lokation.y)<1)
      return false;
  }
  for (Objekt d : jordByg) {
    if (d instanceof Sti)
      continue;
    if (dist(int(x/70)*70+35, int(y/70)*70+35, d.lokation.x, d.lokation.y)<1)
      return false;
  }

  return true;
}
