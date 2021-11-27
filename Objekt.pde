
class Objekt{
  PVector lokation;
  PVector size;
  PImage billede;
  boolean cliked = false;
  
  Objekt(float x,float y,float b,float h){
    lokation = new PVector(x,y);
    size = new PVector(b,h);
  }
  
  void update(){
    mouseCheck();
  }

  void mouseCheck(){
    if(abs(mouseX-lokation.x)<size.x/2 && abs(mouseY-lokation.y)<size.y/2 && mousePressed){
      cliked = true;
    }
  }
}
