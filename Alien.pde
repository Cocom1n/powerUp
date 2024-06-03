class Alien extends GameObject{
  
  float sec, amplitud;
  boolean alienActivo;
  
  public Alien(){
    this.imagen = loadImage("data/alien.png");
    setPos(new PVector(0,height/2));
    setTam(new PVector(50,50));
    setVel(75);
    amplitud=150;
    alienActivo=true;
  }
  
  public void display(){
    if (getPos().x>=width+25){
      alienActivo=false;
    }
    if (getPos().x<=-25){
      alienActivo=true;
    }
    
    if(alienActivo){
      sec += Time.getDeltaTime(frameRate);
      getPos().x+=getVel()*Time.getDeltaTime(frameRate);
      getPos().y = height/2 + amplitud*cos(sec);
      image(imagen,getPos().x, getPos().y, getTam().x,getTam().y);
    }else{
      sec += Time.getDeltaTime(frameRate);
      getPos().x-=getVel()*Time.getDeltaTime(frameRate);
      getPos().y = height/2 + amplitud*cos(sec);
      image(imagen,getPos().x, getPos().y, getTam().x,getTam().y);
    }
    
  }
  
}
