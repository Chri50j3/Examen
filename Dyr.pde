
class Dyr extends Objekt{
  PVector speed = new PVector(0,0);
  boolean idele = true; 
  float topSpeed = 0.2;
  
  Dyr(float x,float y,float b,float h){
    super(x,y,b,h);
  }

  void update(){
    super.update();
    if(cliked == false && idele == true){
      if(frameCount % 120 == 0){
        speed.set(random(-topSpeed,topSpeed),random(-topSpeed,topSpeed));
        
        if(lokation.x < 50)
          speed.x=random(0,topSpeed);
        else if(lokation.x > width-50)
          speed.x=random(-topSpeed,0);
        if(lokation.y < 50)
          speed.y=random(0,topSpeed);
        else if(lokation.y > height-50)
          speed.y=random(-topSpeed,0);
      }
    }
    lokation.add(speed);
  }
  
  void hukTre(){
  }
  
}
