class GardenZombie extends Zombies{  
  
 GardenZombie(int r, int c){
   super(r, c, "images/zombie.png", "garden", 200, 50);
   modImage(70, 120);
   y -= 20;
 }
 
 void move(){
   x -= 1;
 }
 
 void attack(Plant plant){
   plant.health -= 200;
 }
 
 void dead(){
  if (health <= 0){
   ListOfZombies.remove(this);
   thingsToDisplay.remove(this);
   thingsToMove.remove(this);
   backyard.zombieLanes.get(this.row).remove(this);
  }
 }
 
 void update(Plant plant){
  dead();
  System.out.println("Plant row: " + plant.row);
  System.out.println("Zomb row: " + this.row);
  if (plant.row == this.row){
    float i = dist(this.x, this.y, plant.x, plant.y);
    if (i < 60){
      this.attack(plant);
    }
    else{
      this.move();
    }
  }
 }
 
 boolean isTouching(LivingThing other){
   return ((Math.sqrt(Math.pow(this.x - other.x, 2) + Math.pow(this.y - other.y, 2))) <= 50);
 }
}
