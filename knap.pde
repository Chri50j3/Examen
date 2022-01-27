
class Knap extends Objekt {
  String tekst;
  Boolean buildKnap = false;
  String pris;

  Knap(float x, float y, float b, float h, String tekst_) {
    super(x, y, b, h);
    tekst = tekst_;
  }
  Knap(float x, float y, float b, float h, String tekst_, boolean buildKnap_, String pris_) {
    super(x, y, b, h);
    tekst = tekst_;
    buildKnap = buildKnap_;
    pris = pris_;
  }

  void display() {
    strokeWeight(3);
    fill(255, 200, 0, 200);
    rect(lokation.x, lokation.y, size.x, size.y, 10);
    fill(0);
    textSize(19);
    text(tekst, lokation.x, lokation.y+5);

    if (buildKnap) {
      text("Costes " + pris, lokation.x+115, lokation.y+5);
    }

    if (clicked) {
      if (tekst.equals("Resources")) {        
        clicked = false;
        return;
      } 
      tutorial = false;
      fill(222, 200, 130);
      rect(300, height/2, 300, height-200, 50);

      if (tekst.equals("Build")) {
        for (Knap r : BuildKnapper) {
          r.update();
          r.display();
          if (r.clicked) {
            bygningType = r.tekst;
            select = true;
            clicked=false;
          }
        }
      } else if (tekst.equals("Army")) {
        scene = 2;
        clicked = false;
      }
    }
  }
}
