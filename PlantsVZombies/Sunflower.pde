class Sunflower extends Plant implements Updateable{
  
  int genSun;
  
  Sunflower(int r, int c){
    super(r, c, "images/sunflower.png", "sunflower", 50);
    modImage(135, 80);
    genSun = 0;
    health = 100;
  }
  
  boolean makeSun(){
    if (genSun < 120) {genSun ++; return false;}
    else {genSun = 0; return true;}
  }
  
  void update(){
    if (makeSun()) backyard.makeSunSunflower(row, col);
    if (health <= 0){
      backyard.occupied[this.row][this.col] = false;
      ListOfPlant.remove(this);
      thingsToDisplay.remove(this);
      sunflowers.remove(this);
      thingsToUpdate.remove(this);
      backyard.plantLanes.get(this.row).remove(this);
    }
  }
  
  boolean isTouching(LivingThing other) {
   return Math.abs(this.x - other.x) <= 80;
  }
}
