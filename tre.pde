
class Tre extends Objekt{
  int health = 5;

  Tre(float x,float y,float b,float h){
    super(x,y,b,h);
    billede = loadImage("tre.png");
  }
  
  void update(){
      super.update();
      if(cliked && frameCount > frame+65){;
        cliked = false;
        tre++;
        health--;
        frame = frameCount;  
      }
      if(health<1)
        trer.remove(this);
    }
}
