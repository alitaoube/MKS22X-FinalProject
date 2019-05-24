class Peashooter extends Plant{
int peaFrame; 
  Peashooter(int r, int c, String type, int price){
    super(r, c, "images/Peashooter.png", type, price);
    peaFrame = 0;
    //modImage(75, 75);
  }

  void makePea(){
    if (peaFrame >= 90 && !backyard.zombieLanes.get(this.row).isEmpty()){
      Pea p = new Pea(this.x + this.image.width/2, this.y + this.image.height/2);
      peas.add(p);
      thingsToDisplay.add(p);
      peaFrame = 0;
    }
    peaFrame++;
  }
  
  
  
}
