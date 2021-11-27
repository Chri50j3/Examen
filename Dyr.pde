
class Dyr extends Objekt{
  PVector speed = new PVector(0,0);
  boolean idele = true; 
  
  Dyr(float x,float y,float b,float h){
    super(x,y,b,h);
  }

  void update(){
    super.update();
    if(cliked == false && idele == true){
      if(frameCount % 120 == 0){
        speed.set(random(-1,1),random(-1,1));
        
        if(lokation.x < 50)
          speed.x=random(0,1);
        else if(lokation.x > width-50)
          speed.x=random(-1,0);
        if(lokation.y < 50)
          speed.y=random(0,1);
        else if(lokation.y > height-50)
          speed.y=random(-1,0);
      }
      lokation.add(speed);
    }
  }
}
