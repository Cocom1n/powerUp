class Tank extends GameObject{
  
  float sec, amplitud;
  
  public Tank(){
    this.imagen = loadImage("data/tank.png");
    setTam(new PVector(50,50));
    setPos(new PVector(0,40));
    amplitud=(width/2)-(getTam().x/2);
  }
  
  public void display(){
    sec += Time.getDeltaTime(frameRate);
    getPos().x = width/2 +amplitud*sin(sec);
    image(imagen, getPos().x, getPos().y, getTam().x,getTam().y);
  }
  
  public void disparar(){
    if (frameCount % 60 == 0 ) {
      Balas nuevaBala =new Balas(enemigo.getPos()); 
      balas.add(nuevaBala);
    }
  }

}
