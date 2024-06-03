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

 if (!activarPowerUp){
   powerUp.display();
 }
 
 //calcula la distancia entre el jugador y el Power up para activar el juego
 float distancia = dist(gato.getPos().x,gato.getPos().y,powerUp.getPos().x,powerUp.getPos().y);
 if(distancia < gato.getTam().x + powerUp.getTam().x){
   activarPowerUp=true;
 }
 
 if (activarPowerUp){
   alien.display();
   enemigo.display();
   //disparos
   if(contador==0){
     Balas nuevaBala =new Balas(enemigo.getPos()); 
     balas.add(nuevaBala);
     contador++;
   }
 }
 
 for(int i = balas.size()-1; i >= 0; i--){
    Balas b = balas.get(i);
    b.mover();
    b.display();
    if(b.getDestruir()){
      balas.remove(i);
      contador=0;
    }
  }
}

void mouseMoved() {
  gato.setPos(new PVector(mouseX, mouseY));
}
