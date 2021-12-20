
class Knap extends Objekt {
  String tekst;

  Knap(float x, float y, float b, float h, String tekst_) {
    super(x, y, b, h);
    tekst = tekst_;
  }

  void display() {
    strokeWeight(3);
    fill(255, 200, 0, 200);
    rect(lokation.x, lokation.y, size.x, size.y, 10);
    fill(0);
    textSize(19);
    text(tekst, lokation.x, lokation.y);

    if (clicked) {
      fill(222, 200, 130);
      rect(300, height/2, 300, height-200, 50);
      if (tekst.equals("Resources")) {        
        fill(0);
        textSize(30);
        textAlign(LEFT);
        text("Wood: " + tre, 200, 200);
        text("Stone: " + sten, 200, 250);
        text("Meat: " + kod, 200, 300);
        text("Weed: " + korn, 200, 350);
        textAlign(CENTER);
      } 
      else if (tekst.equals("Build")) {
        for (Knap r : BuildKnapper) {
          r.update();
          r.display();
          if (r.clicked) {
            bygningType = r.tekst;
            select = true;
            clicked=false;
          }
        }
      }
     else if(tekst.equals("Army")){
       scene = 2;
       clicked = false;
     }
    }
  }
}
