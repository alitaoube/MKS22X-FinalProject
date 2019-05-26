class GardenZombie extends Zombies{
  
 GardenZombie(int r, int c){
   super(r, c, "images/zombie.png", "garden", 10, 50);
   modImage(70, 120);
   y -= 20;
 }
 
 void move(){
   x -= 1;
 }
 
 void move(Plant plant){
   if (!this.isTouching(plant)){
     x -= 1;
   }
 }
 
 void attack(){
 }
 
 boolean isTouching(LivingThing other){
   return ((Math.sqrt(Math.pow(this.x - other.x, 2) + Math.pow(this.y - other.y, 2))) <= 50);
 }
}
