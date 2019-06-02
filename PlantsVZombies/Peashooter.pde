class Peashooter extends Plant implements Updateable{
int peaFrame;

  Peashooter(int r, int c, String type, int price){
    super(r, c, "images/Peashooter1.png", type, price);
    peaFrame = 0;
    health = 100;
  }

  void makePea(){
    if (peaFrame >= 30 && !backyard.zombieLanes.get(this.row).isEmpty()){
      Pea p = new Pea(this.x, this.y, this.row);
      peas.add(p);
      thingsToDisplay.add(p);
      peaFrame = 0;
    }
    peaFrame++;
  }
  
  void update(){
    makePea();
    if (health <= 0){
      backyard.occupied[this.row][this.col] = false;
      ListOfPlant.remove(this);
      thingsToDisplay.remove(this);
      peashooters.remove(this);
      backyard.plantLanes.get(this.row).remove(this);
    }
  }
  
}
