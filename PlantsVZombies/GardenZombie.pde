class GardenZombie extends Zombies {  

  GardenZombie(int r, int c) {
    super(r, c, "images/zombie.png", "garden", 200, 50);
    modImage(70, 120);
    y -= 20;
  }

  void move() {
    x -= 3;
  }

  void attack(Plant plant) {
    plant.health -= 0;
  }

  void dead() {
    if (health <= 0) {
      ListOfZombies.remove(this);
      thingsToDisplay.remove(this);
      thingsToMove.remove(this);
    }
  }

  //plantLanes

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

//  void update() {
//    dead();

//    if (!backyard.plantLanes.get(this.row).isEmpty()) {    
//      ArrayList<Plant> lane = backyard.plantLanes.get(this.row);
      
      
//      for (int x = this.col - 1; x > -1; x--){
        
//        if (backyard.occupied(this.row, x)){
//          float i = dist(this.x, this.y, backyard.plantLanes.get(this.row).get(x).x, backyard.plantLanes.get(this.row).get(x).y);
//          if (i < 60){
//            this.attack(backyard.plantLanes.get(this.row).get(x));
//          }
//          else{
//            this.move();
//          }
//        }
//      }
//      //  float i = dist(this.x, this.y, backyard.plantLanes.get(this.row).get(this.col).x, backyard.plantLanes.get(this.row).get(this.col - 1).y);

//      //if (i < 60) {
//      //  this.attack(backyard.plantLanes.get(this.row).get(this.col));
//      //} else {
//      //  this.move();
//      //}
//    }
//    else{
//      this.move();
//    }
//    //if (backyard.plantLanes.get(this.row).isEmpty()) this.move();
//  }

  boolean isTouching(LivingThing other) {
    return ((Math.sqrt(Math.pow(this.x - other.x, 2) + Math.pow(this.y - other.y, 2))) <= 50);
  }
}
