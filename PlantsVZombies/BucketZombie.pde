class BucketZombie extends Zombies{
  PImage hat;
  
  BucketZombie(int r, int c){
    super(r, c, "images/bucket.png", "bucket", 300, 50);
    hat = loadImage("images/bucket.png");
    hat.resize(60, 60);
  }
  
  void dead(){
    if (health <= 0){
      kill();
    }
   }
}
