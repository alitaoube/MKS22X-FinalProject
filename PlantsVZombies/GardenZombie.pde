class GardenZombie extends Zombies{
  
 GardenZombie(int r, int c, int xcor, int ycor, String picture, String type, int hp, int spd){
   super(r, c, xcor, ycor, picture, type, hp, spd);
   modImage(90, 150);
 }
 
 void move(){
   x -= 1;
 }
 
 void attack(){
 }
 
 boolean isTouching(LivingThing other){
   return ((Math.sqrt(Math.pow(this.x - other.x, 2) + Math.pow(this.y - other.y, 2))) <= 50);
 }
}
