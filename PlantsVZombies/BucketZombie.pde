class BucketZombie extends Zombies{
  
  
  BucketZombie(int r, int c){
    super(r, c, "images/bucket.png", "cone", 300, 50);
    image = loadImage("images/bucket.png");
    image.resize(80, 120);
  }
  
  void dead(){
    if (health <= 100 && health > 0){
      image.resize(70, 120);
    }
    if (health <= 0){
     ListOfZombies.remove(this);
     thingsToDisplay.remove(this);
     thingsToMove.remove(this);
     backyard.zombieLanes.get(this.row).remove(this);
    }
   }
   
  void display(){
   image(image, x, y);
  }
}
