
class Knap extends Objekt{
  String tekst;
  
  Knap(float x,float y,float b,float h, String tekst_){
    super(x,y,b,h);
    tekst = tekst_;
  }
  
  void update(){
    super.update();
  }
  
  void display(){
    strokeWeight(3);
    fill(255,200,0,200);
    rect(lokation.x,lokation.y,100,100,10);
    fill(0);
    textSize(19);
    text(tekst,lokation.x,lokation.y);
    
    if(cliked){
      fill(222,200,130);
      rect(width/2,height/2,width-200,height-200,50);
      
      if(tekst.equals("Resources")){
        fill(0);
        textSize(30);
        textAlign(LEFT);
        text("Wood: " + tre, 200,250);
        text("Weed: " + korn, 200,300);
        text("Mead: " + kod, 200,350);
        textAlign(CENTER);
      }
    }
  }
}
