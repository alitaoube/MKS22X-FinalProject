class Peashooter extends Plant implements Updateable{
int peaFrame;

  //creates the peashooter object and resizes all of its associated images
  Peashooter(int r, int c, String type, int price){
    super(r, c, type, price);
    for (int x = 0; x < spriteNames.length; x++){
     if (spriteNames[x].contains(type)) localSprites.add(sprites.get(x));
    }
    peaFrame = 0;
    health = 100;
    for (int x = 0; x < localSprites.size(); x++){
     localSprites.get(x).resize(80, 80); 
    }
  }

  //every 30 seconds it makes a pea
  void makePea(){
    if (peaFrame >= 30 && !backyard.zombieLanes.get(this.row).isEmpty()){
      Pea p = new Pea(this.x, this.y, this.row);
      peas.add(p);
      thingsToDisplay.add(p);
      thingsToUpdate.add(p);
      peaFrame = 0;
    }
    peaFrame++;
  }
  
  //displays the peashooter and then fires a pea if necessary and then dies if necessary.
  void update(){
    image.resize(80, 80);
    display();
    makePea();    
    if (health <= 0){
      backyard.occupied[this.row][this.col] = false;
      ListOfPlant.remove(this);
      thingsToDisplay.remove(this);
      thingsToUpdate.remove(this);
      peashooters.remove(this);
      backyard.plantLanes.get(this.row).remove(this);
      removedFromList = true;
      kill();
    }
  }
  
}
