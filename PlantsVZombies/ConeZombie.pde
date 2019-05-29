class ConeZombie extends Zombies{
   ConeZombie(int r, int c){
   super(r, c, "images/cone.jpg", "cone", 300, 50);
   modImage(70, 120);
   y -= 20;
   }
   
   void move(){
     x-=1;
   }
   
 void dead(){
  if (health <= 100 && health > 0){
    image = loadImage("/images/zombie.png/");
  }
  if (health <= 0){
   ListOfZombies.remove(this);
   thingsToDisplay.remove(this);
   thingsToMove.remove(this);
  }
 }
 
 void update(Plant plant){
  dead();
  float i = dist(this.x, this.y, plant.x, plant.y);
  if (i < 60){
    this.attack(plant);
  }
  else{
    this.move();
  }
 }
  boolean isTouching(LivingThing other){
   return ((Math.sqrt(Math.pow(this.x - other.x, 2) + Math.pow(this.y - other.y, 2))) <= 50);
 }
}
