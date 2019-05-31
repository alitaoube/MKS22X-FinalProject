class Sunflower extends Plant{
  
  int genSun;
  
  Sunflower(int r, int c){
    super(r, c, "images/sunflower.jpg", "sunflower", 50);
    genSun = 0;
    health = 100;
  }
  
  boolean makeSun(){
    if (genSun < 120) {genSun ++; return false;}
    else {genSun = 0; return true;}
  }
  
  void update(){
    display();
    makeSun();
    if (health <= 0){
      backyard.occupied[this.row][this.col] = false;
      ListOfPlant.remove(this);
      thingsToDisplay.remove(this);
      sunflowers.remove(this);
      backyard.plantLanes.get(this.row).remove(this);
    }
  }
}
