class GardenZombie extends Zombies{
  
 GardenZombie(int r, int c, String picture, String type, int hp, int spd){
   super(r, c, picture, type, hp, spd);
   modImage(90, 150);
 }
 
 void move(){
   x -= speed;
 }
 
 void attack(){
 }
}
