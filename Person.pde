
class Person extends Dyr{
  PVector findVej = new PVector(0,0);
  boolean hukker = false;
  
  Person(float x,float y,float b,float h){
    super(x,y,b,h);
    billede = loadImage("mand.png");
  }

  void update(){
    super.update();
    
    if(!idele && !hukker)
      walk();
    
  }
  
  void hukTre(){
    idele = false;
    float dist = 10000;
    for(Tre d: trer){
      if(dist > dist(lokation.x,lokation.y,d.lokation.x,d.lokation.y)){
        dist = dist(lokation.x,lokation.y,d.lokation.x,d.lokation.y);
        findVej.set(d.lokation.x,d.lokation.y);
      }
    }
  }
  
  void walk(){
    if(!idele){
      if(dist(lokation.x,lokation.y,findVej.x,findVej.y)>30){
        speed.set(findVej.x-lokation.x,findVej.y-lokation.y);
        speed.setMag(topSpeed);
      }
      else{
        speed.setMag(0);
        hukker = true;
      }
    }
  }
}
