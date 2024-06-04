class Player extends GameObject{
  
  boolean coliconBala, colicionAlien;
  int vidas;
  public Player(){
    this.imagen = loadImage("data/player.png");
    setPos(new PVector(mouseX, mouseY));
    setTam(new PVector(50,50));
    this.vidas=100;
  }
  
  public void display(){
    image(imagen,getPos().x, getPos().y, getTam().x,getTam().y);
  }
  
  public void displayVida(){
    if(vidas>=0){
      textSize(25);
      text("Vida:"+vidas,10,height-20);
    }else{
      textSize(50);
      text("FIN DEL JUEGO",width/5,height/2);
      vidas=100;
      activarPowerUp=false;
    }   
  }
  
  public void colicionBala(PVector pos, float tam){
    coliconBala=false;
    float distancia = dist(getPos().x,getPos().y, pos.x,pos.y);
    if (distancia < getTam().x/2+tam/2){
      coliconBala= true;
      vidas--;
    }
  }
  
  public void colicionAlien(PVector pos, float tam){
    colicionAlien=false;
    float distancia = dist(getPos().x,getPos().y, pos.x,pos.y);
    if (distancia < getTam().x/2+tam/2){
      colicionAlien= true;
      vidas--;
    }
  }
}
