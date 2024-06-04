Player gato;
Power powerUp;
Tank enemigo;
Alien alien;
boolean activarPowerUp;
PImage fondo;
ArrayList<Balas> balas;
int contador;


void setup(){
  size(500,500);
  this.fondo = loadImage("data/back.jpg");
  gato = new Player();
  powerUp = new Power();
  enemigo = new Tank();
  alien = new Alien();
  balas = new ArrayList<Balas>();
  activarPowerUp = false;
  contador=0;
}

void draw(){
 background(255);
 imageMode(CENTER);
 image(fondo,width/2, height/2, width, height);
 gato.display();
 gato.displayVida();

 if (!activarPowerUp){
   powerUp.display();
 }
 
 //calcula la distancia entre el jugador y el Power up para activar el juego
 float distancia = dist(gato.getPos().x,gato.getPos().y,powerUp.getPos().x,powerUp.getPos().y);
 if(distancia < gato.getTam().x/2 + powerUp.getTam().x/2){
   activarPowerUp=true;
 }
 
 if (activarPowerUp){
   alien.display();
   gato.colicionAlien(alien.getPos(), alien.getTam().x);
   
   enemigo.display();
    enemigo.disparar();
 
 
   for(int i = balas.size()-1; i >= 0; i--){
      Balas b = balas.get(i);
      b.mover();
      b.display();
      gato.colicionBala(b.getPos(),b.getTam().x);
      if(gato.coliconBala){
        balas.remove(i);
      }
      if(b.getDestruir()){
        balas.remove(i);
      }
    }
  }
}

void mouseMoved() {
  gato.setPos(new PVector(mouseX, mouseY));
}
