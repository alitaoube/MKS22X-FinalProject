class Potato extends Plant implements Updateable{
  PImage image1, image2, spudow;
  int timer, timer2;
  Potato(int r, int c){
    super(r, c, "potato.png", "potato", 25);
    image1 = loadImage("images/mine1.png");
    image = image1;
    image2 = loadImage("images/mine2.png");
    spudow = loadImage("images/spudow.png");
    spudow.resize(350, 250);
  }
  
  void update(){
    if (timer >= 90) image = image2;
    else timer++;
    
    exploding();
  }
  
  void exploding(){
    for (int idx = 0; idx < ListOfZombies.size(); idx ++){
      Zombies z = ListOfZombies.get(idx);    
      if (timer >= 90 && this.isTouching(z)) {
        if (timer2 < 15){
          image = spudow;
          timer2++;
        }
        else{
          this.kill(); z.kill();
        }  
    }
    }
  }
  
  void kill(){
    backyard.plantLanes.get(row).remove(this);
    thingsToDisplay.remove(this);
    ListOfZombies.remove(this);
    thingsToMove.remove(this);
    thingsToUpdate.remove(this);
    ListOfPlant.remove(this);
  }
  
  void display(){
   image(image, x, y);
  }
}
