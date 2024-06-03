class Balas extends GameObject{
  
  PImage Image;
  boolean destruir;
  
  public Balas(PVector enemigo){
    setPos(new PVector(enemigo.x,enemigo.y));
    setVel(15);
    this.Image = loadImage("data/bala.png");
    destruir=false;
  }
  
  public void display(){
    image(Image, getPos().x, getPos().y, 50,50);
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
