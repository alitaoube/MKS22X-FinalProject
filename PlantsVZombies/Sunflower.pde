class Sunflower extends Plant implements Updateable{
  
  int genSun;
  
  Sunflower(int r, int c){
    super(r, c, "sunflower", 50);
    genSun = 0;
    health = 100;
    
    for (int x = 0; x < spriteNames.length; x++){
     System.out.println(type);
     if (spriteNames[x].contains("sunflower")){
       localSprites.add(sprites.get(x));
     }
    }
    
    for (int x = 0; x < localSprites.size(); x++){
     localSprites.get(x).resize(80, 80); 
    }
  }
  
  boolean makeSun(){
    if (genSun < 250) {genSun ++; return false;}
    else {genSun = 0; return true;}
  }
  
  void update(){
    display();
    if (makeSun()) backyard.makeSunSunflower(row, col);
    if (health <= 0){
      backyard.occupied[this.row][this.col] = false;
      ListOfPlant.remove(this);
      thingsToDisplay.remove(this);
      sunflowers.remove(this);
      thingsToUpdate.remove(this);
      backyard.plantLanes.get(this.row).remove(this);
      removedFromList = true;
    }
  }
}
