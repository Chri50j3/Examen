
void tegnBy() {
  baggrund();
  for (Dyr d : dyrListe) { //bruger polymorfi så jeg kan tegne alle mine dyr og alle mine bygninger, og ikke skal gøre det for hver enkelt klasse
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

  fri = checkFri(mouseX, mouseY); // checker om der allerede er en bygning eller træer på det felt, man prøver at bygge på
  UI();

  if (frameCount%1000 == 0) { //tilføjer et nyt træ, hvert 1000. frame
    float x = int(random(1, 27))*70+35;
    float y = int(random(1, 15))*70+35;
    if (checkFri(x, y))
      trer.add(new Tre(x, y, 70, 70));
  }
}

void baggrund() {
  strokeWeight(1);
  background(45, 122, 66);
  image(BG, width/2, height/2);
  fill(45, 122, 66, 100);
  rect(width/2, height/2, width, height);

  if (scene == 1) {// hvis den viser byen, så skal den tegne de objekter, der ligger på jorden før den tegner dyrene og bygningerne
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
    while (i < width) { // tegner en masse gennemsigtige tern, når man skal til at bygge
      int y = 0;
      while (y < height) {
        push();
        rectMode(CORNER);
        fill(0, 10);
        noStroke();
        rect(i, y, 70, 70);
        rect(i+70, y+70, 70, 70);
        y+=140;
        pop();
      }
      i+=140;
    }

    sqareX = int(mouseX/70)*70+35; // laver musens koordinaet om til at passe med byens gridd
    sqareY = int(mouseY/70)*70+35;

    if (fri) // tegner et fælt, der enden er gult eller rødt, alt efter om man må bygge der eller ej
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

    fill(255, 200, 0, 200); // textboks der informere om at man kan rotere bygninger
    rect(width-150, height-75, 200, 75, 10);
    fill(0);
    text("Rotate with , and .", width-150, height-70);
  }

  fill(255, 200, 0, 200); // viser ens resurcer
  rect(365, 63, 450, 35);
  fill(0);
  textSize(20);
  textAlign(LEFT);
  text("Wood: " + tre + " |"+"Stone: " + sten+ " |"+"Meat: " + kod+ " |"+"Weed: " + korn, 185, 70);
  textAlign(CENTER);

  for (Knap k : knapper) {
    k.display();
    k.update();
  }

  if (tutorial) {
    fill(255, 200, 0);
    noStroke();
    triangle(150, 160, 200, 120, 200, 200);
    rect(225, 160, 50, 35);
    stroke(0);
    fill(255);
    text("Build a house, a farm, and cattle", 400, 165);
  }
}

boolean checkFri(float x, float y) { // ser om x og y ligger 

  for (Bygning d : bygninger) {
    if (dist(int(x/70)*70+35, int(y/70)*70+35, d.lokation.x, d.lokation.y)<1)
      return false;
  }
  for (Tre d : trer) {
    if (dist(int(x/70)*70+35, int(y/70)*70+35, d.lokation.x, d.lokation.y)<1)
      return false;
  }
  for (Objekt d : jordByg) {
    if (d instanceof Sti) // man kan godt bygge oven på en sti
      continue;
    if (dist(int(x/70)*70+35, int(y/70)*70+35, d.lokation.x, d.lokation.y)<1)
      return false;
  }

  return true;
}
