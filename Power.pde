class Power extends GameObject{
  
  float angulo;
  
  public Power(){
    this.imagen=loadImage("data/bullet.png");
    setTam(new PVector(50,50));
    angulo=0;
    setPos(new PVector(width/2,0));
  }
  
  public void display(){
    angulo+=0.1;
    getPos().y=400+getTam().x*sin(angulo);
    image(imagen,getPos().x, getPos().y, getTam().x,getTam().y);
  }
}
