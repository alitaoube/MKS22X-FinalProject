////<<<<<<< HEAD
//class GardenZombie extends Zombies{  
  
// GardenZombie(int r, int c){
//   super(r, c, "images/zombie.png", "garden", 200, 50);
//   modImage(70, 120);
//   y -= 20;
// }
 
// void move(){
//   x -= 1;
// }
 
// void attack(Plant plant){
//   plant.health -= 200;
// }
 

 
// void update(Plant plant){
//  dead();
//  System.out.println("Plant row: " + plant.row);
//  System.out.println("Zomb row: " + this.row);
//  if (plant.row == this.row){
//    float i = dist(this.x, this.y, plant.x, plant.y);
//    if (i < 60){
//      this.attack(plant);
//    }
//    else{
//      this.move();
//    }
//  }
// }
 
// void update(){
   
// }
 
 
// boolean isTouching(LivingThing other){
//   return ((Math.sqrt(Math.pow(this.x - other.x, 2) + Math.pow(this.y - other.y, 2))) <= 50);
// }
//}
////=======
class GardenZombie extends Zombies {  
  
void dead(){
    if (health <= 0){
       ListOfZombies.remove(this);
       thingsToDisplay.remove(this);
       thingsToMove.remove(this);
       backyard.zombieLanes.get(this.row).remove(this);
    }
 }

  GardenZombie(int r, int c) {
    super(r, c, "images/zombie.png", "garden", 200, 50);
    modImage(70, 120);
    y -= 20;
  }

  void move() {
    x -= 1;
  }

  void attack(Plant plant) {
    plant.health -= 10;
  }

  //void dead() {
  //  if (health <= 0) {
  //    ListOfZombies.remove(this);
  //    thingsToDisplay.remove(this);
  //    thingsToMove.remove(this);
  //    backyard.zombieLanes.get(this.row).remove(this);
  //  }
  //}

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

  void update() {
    dead();
    if (backyard.plantLanes.get(this.row).isEmpty()) this.move();
    else {
      boolean hasAttacked = false;
      boolean isTouching = false;
      for (int idx = backyard.plantLanes.get(this.row).size() - 1; idx >= 0; idx --){
        Plant maybeAttack = backyard.plantLanes.get(this.row).get(idx);
        isTouching = this.isTouching(maybeAttack);
        if (isTouching) {
          this.attack(maybeAttack);
          hasAttacked = true;
        }
      }
      if (!hasAttacked) this.move();
    }
  }
      //ArrayList<Plant> lane = backyard.plantLanes.get(this.row);
      
      
      //for (int x = this.col - 1; x > -1; x--){
        
      //  if (backyard.occupied(this.row, x)){
      //    float i = dist(this.x, this.y, backyard.plantLanes.get(this.row).get(x).x, backyard.plantLanes.get(this.row).get(x).y);
      //    if (i < 60){
      //      this.attack(backyard.plantLanes.get(this.row).get(x));
      //    }
      //    else{
      //      this.move();
      //    }
      //  }
      //}
      //  float i = dist(this.x, this.y, backyard.plantLanes.get(this.row).get(this.col).x, backyard.plantLanes.get(this.row).get(this.col - 1).y);

      //if (i < 60) {
      //  this.attack(backyard.plantLanes.get(this.row).get(this.col));
      //} else {
      //  this.move();
      //}
   // }
   // else{
   //   this.move();
  //  }
    //if (backyard.plantLanes.get(this.row).isEmpty()) this.move();
 // }

  boolean isTouching(LivingThing other) {
    return Math.abs(this.x - other.x) <= 60;
  }
}
//>>>>>>> 9bc860c4237a56faad72951bcbb783f4c226e814
