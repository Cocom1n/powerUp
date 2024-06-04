class Balas extends GameObject{
  
  PImage Image;
  boolean destruir;
  
  public Balas(PVector enemigo){
    setPos(new PVector(enemigo.x,enemigo.y));
    setTam(new PVector(50,50));
    setVel(12);
    this.Image = loadImage("data/bala.png");
    destruir=false;
  }
  
  public void display(){
    image(Image, getPos().x, getPos().y, getTam().x,getTam().y);
  }
  
  public void mover(){
    getPos().y+=getVel();
    if(getPos().y>=height){
      destruir=true;
    }
  }
  
  public boolean getDestruir(){
    return destruir;
  }
}
