class GardenZombie extends Zombies{
  
 GardenZombie(int r, int c, int xcor, int ycor, String picture, String type, int hp, int spd){
   super(r, c, xcor, ycor, picture, type, hp, spd);
   modImage(90, 150);
 }
 
 void move(){
   x-=speed;
 }
 
 void attack(){
 }
 
 boolean isTouching(LivingThing other){
   return (dist(this.x, this.y, other.x, other.y) <= 10);
 }
}
