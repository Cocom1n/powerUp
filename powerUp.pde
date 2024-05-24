float r,x,y, angulo, radio;
float rP,xP,yP,anguloP, radioP;
boolean activarPowerUp;
void setup(){
  size(500,500);
  r = 100;
  angulo = 0;
  radio = 20;
  rP = 20;
  anguloP = 0;
  radioP = 30;
  activarPowerUp = false;
}

void draw(){
 background(255);
 fill(0,0,255);
 circle(mouseX,mouseY,radio);
 noFill();
 
 anguloP += 0.1;
 xP=width/2;
 yP=400+rP*sin(anguloP);
 fill(151,252,255 );
 circle(xP,yP,radioP);
  
 float distancia = dist(mouseX,mouseY,xP,yP);
 if(distancia<radio/2+radioP/2){
   activarPowerUp=true;
   println(activarPowerUp);
 }
 
 if (activarPowerUp){
  for(float c=0; c<=9; c++){
    angulo += 0.002;
    x=mouseX+r*cos(angulo+c*0.62);
    y=mouseY+r*sin(angulo+c*0.62);
    fill(250,0,0);
    circle(x,y,20);
    println(c);
   }
 }
 
 

 
 //for(float a=0; a<360; a++){
 // x=mouseX+r*cos(a);
 // y=mouseY+r*sin(a);
 // point(x,y);
 //}
}
