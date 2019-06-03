class BucketZombie extends Zombies{
  ArrayList<PImage> sprites;

  BucketZombie(int r, int c){
    super(r, c, "images/bucket.png", "cone", 300, 50);
    y -= 20;
    sprites = new ArrayList<PImage>();
    sprites.add(loadImage("images/bucket.png"));
    sprites.add(loadImage("images/zombie.png"));
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
}
