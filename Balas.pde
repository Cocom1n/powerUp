class Balas {
  private PVector pos;
  private float vel;
  PImage Image;
  boolean destruir;
  
  public Balas(PVector enemigo){
    this.pos = new PVector(enemigo.x,enemigo.y);
    this.vel=10;
    this.Image = loadImage("data/bala.png");
    destruir=false;
  }
  
  public void display(){
    image(Image, pos.x, pos.y, 50,50);
  }
  
  public void mover(){
    pos.y+=vel;
    if(pos.y>=height){
      destruir=true;
    }
  }
  
  public boolean getDestruir(){
    return destruir;
  }
}
