
class Hus extends Objekt{
  
  Hus(float x,float y,float b,float h){
    super(x,y,b,h);
    billede = loadImage("hus.png");
    
    tre -= 5;
  }

  void update(){
      super.update();
    }
}
