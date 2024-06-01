float radio;
float rP,xP,yP,anguloP, radioP;
boolean activarPowerUp;
PImage fondo, gato1, power, enemigo, alien;
PVector posEnemigo, posAlien;
float deltaTime, seg;
ArrayList<Balas> balas;
int contador;


void setup(){
  size(500,500);
  deltaTime = 1.0/round(frameRate);
  this.fondo = loadImage("data/back.jpg");
  this.gato1 = loadImage("data/player.png");
  this.power = loadImage("data/bullet.png");
  this.enemigo = loadImage("data/tank.png");
  this.alien = loadImage("data/alien.png");
  posEnemigo = new PVector(width/2,50);
  posAlien = new PVector(0,height/2);
  balas = new ArrayList<Balas>();
  activarPowerUp = false;
  contador=0;
  radio = 20;
  rP = 20;
  anguloP = 0;
  radioP = 30;
}

void draw(){
 background(255);
 imageMode(CENTER);
 image(fondo,width/2, height/2, width, height);
 fill(0,0,255);
 //jugador
 image(gato1,mouseX,mouseY,radio*2, radio*2);
 noFill();
 
 if (!activarPowerUp){
   //powerup
   anguloP += 0.1;
   xP=width/2;
   yP=400+rP*sin(anguloP);
   fill(151,252,255 );
   image(power,xP, yP,radioP*2, radioP*2);
 }

 float distancia = dist(mouseX,mouseY,xP,yP);
 if(distancia<radio/2+radioP/2){
   activarPowerUp=true;
   println(activarPowerUp);
 }
 
 if (activarPowerUp){
   //enemigo
   seg+=deltaTime;
   posEnemigo.x = width/2 +width/2*sin(seg);
   image(enemigo,posEnemigo.x, posEnemigo.y, 50, 50);
   //disparos
   if(contador==0){
     Balas nuevaBala =new Balas(posEnemigo); 
     balas.add(nuevaBala);
     contador++;
   }
   //alien
   image(alien,posAlien.x, posAlien.y, 50, 50);
   posAlien.y=height/2+200*cos(seg);
   posAlien.x+=50*deltaTime;
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
