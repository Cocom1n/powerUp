class Player extends GameObject{
  
  public Player(){
    this.imagen = loadImage("data/player.png");
    setPos(new PVector(mouseX, mouseY));
    setTam(new PVector(50,50));
  }
  
  public void display(){
    image(imagen,getPos().x, getPos().y, getTam().x,getTam().y);
  }
  
}
