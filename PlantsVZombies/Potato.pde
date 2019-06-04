class Potato extends Plant implements Updateable{
  PImage image1, image2;
  int timer;
  Potato(int r, int c){
    super(r, c, "potato.png", "potato", 25);
    image1 = loadImage("images/mine1.png");
    image = image1;
    image2 = loadImage("images/mine2.png");
  }
  
  void update(){
    if (timer >= 90) image = image2;
    else timer++;
    
    exploding();
  }
  
  void exploding(){
    for (int idx = 0; idx < ListOfZombies.size(); idx ++){
      Zombies z = ListOfZombies.get(idx);
      System.out.println(timer >= 90);
      System.out.println("BREAK");
      System.out.println(abs(dist(this.x, this.y, z.x, z.y)) < 60);
      
      if (timer >= 90 && this.isTouching(z)) {
      this.kill(); z.kill(); z.cherried = true;
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
