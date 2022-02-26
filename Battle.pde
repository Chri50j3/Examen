void battleStart(int enemys) {
  for (int i =0; i<enemys; i++) { // Tilføjer den mængde fjænder som man giver i inputet
    soldater.add(new Soldat(random(0, width/2), random(0, height), 70, 70, false));
  }
  for (Dyr r : dyrListe) { // laver en venlig soldat for hver borger i byen
    if (r instanceof Person == true)
      soldater.add(new Soldat(random(width/2, width), random(0, height), 70, 70, true));
  }
}

void tegnBattle() {
  baggrund();

  for (Soldat r : soldater) {
    int i = soldater.size();
    r.update();
    r.display();
    if (r.HP<=0) {
      soldater.remove(r);
    }
    if (i != soldater.size())
      break;
  }
}

void battleEnd(boolean won) {
  if (won) { // man får resucer hvis man vinder
    tre += int(random(5, 20));
    kod += int(random(5, 20));
    sten += int(random(5, 20));
    korn += int(random(5, 20));
  }
  soldater.clear();
  scene = 2;
}
