
void tegnKort(){
  fill(0);
  textSize(25);
  image(kort,width/2,height/2,width,height);
  
  image(by, 1200,500,140,140);
  text(byNavn,1190,590);
  
  image(slot, 1550,750,140,140);
  text("Castle",1540,840);
  
  noStroke();
  fill(0,0,0,100);
  rect(210,height/2+10,300,height-100,10);
  fill(255, 190, 130,200);
  stroke(0);
  rect(200,height/2,300,height-100,10);
  fill(0);
  text("Citizens: "+ borgere,200,200);
  
  checkClick();
}

void checkClick(){
  if(abs(mouseX-1550)<70 && abs(mouseY-750)<70 && mousePressed){
    battleStart(10);
    scene = 3;
  }
  else if(abs(mouseX-1200)<70 && abs(mouseY-500)<70 && mousePressed){
    scene = 1;
  }
}
