class Peashooter extends Plant implements Updateable{
int peaFrame;

  Peashooter(int r, int c, String type, int price){
    super(r, c, type, price);
    for (int x = 0; x < spriteNames.length; x++){
     System.out.println(type);
     if (spriteNames[x].contains(type)) localSprites.add(sprites.get(x));
    }
    peaFrame = 0;
    health = 100;
    for (int x = 0; x < localSprites.size(); x++){
     localSprites.get(x).resize(80, 80); 
    }
  }

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
  
  void update(){
    display();
    makePea();
    if (type == "peashooter") image.resize(80, 80);
    
    if (health <= 0){
//<<<<<<< HEAD
      backyard.occupied[this.row][this.col] = false;
      ListOfPlant.remove(this);
      thingsToDisplay.remove(this);
      thingsToUpdate.remove(this);
      peashooters.remove(this);
      backyard.plantLanes.get(this.row).remove(this);
      removedFromList = true;
//=======
      kill();
//>>>>>>> 857e4c3a090f86aa16baff26d6700853a84517f1
    }
  }
  
}
