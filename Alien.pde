class Alien extends GameObject{
  
  float sec, amplitud;
  boolean alienActivo;
  
  public Alien(){
    this.imagen = loadImage("data/alien.png");
    setPos(new PVector(0,0));
    setTam(new PVector(60,60));
    setVel(75);
    amplitud=150;
    alienActivo=true;
    
  }
  
  public void display(){
    sec += Time.getDeltaTime(frameRate);
    getPos().y = height/2 + amplitud*cos(sec);
    image(imagen,getPos().x, getPos().y, getTam().x,getTam().y);

    if (getPos().x>=width+25){
      alienActivo=false;
    }
    if (getPos().x<=-25){
      alienActivo=true;
    }
    
    if(alienActivo){
      getPos().x+=getVel()*Time.getDeltaTime(frameRate);
    }else{
      getPos().x-=getVel()*Time.getDeltaTime(frameRate);
    }
  }
  
}
