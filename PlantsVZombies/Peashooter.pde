class Peashooter extends Plant implements Updateable{
int peaFrame; 
  Peashooter(int r, int c, String type, int price){
    super(r, c, "images/Peashooter.png", type, price);
    peaFrame = 0;
    health = 480;
    //modImage(75, 75);
  }

  void makePea(){
    if (peaFrame >= 90 && !backyard.zombieLanes.get(this.row).isEmpty()){
      Pea p = new Pea(this.x + this.image.width/2, this.y + this.image.height/2, this.row);
      peas.add(p);
      thingsToDisplay.add(p);
      peaFrame = 0;
    }
    peaFrame++;
  }
  
  void update(){
    makePea();
//<<<<<<< HEAD
    
//=======
//>>>>>>> 9bc860c4237a56faad72951bcbb783f4c226e814
    if (health <= 0){
      backyard.occupied[this.row][this.col] = false;
      ListOfPlant.remove(this);
      thingsToDisplay.remove(this);
      peashooters.remove(this);
//<<<<<<< HEAD
//=======
      backyard.plantLanes.get(this.row).remove(this);
//>>>>>>> 9bc860c4237a56faad72951bcbb783f4c226e814
    }
  }
  
}
