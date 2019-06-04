class BucketZombie extends Zombies{
  PImage hat;
  
  BucketZombie(int r, int c){
    super(r, c, "images/bucket.png", "cone", 300, 50);
    hat = loadImage("images/bucket.png");
    hat.resize(60, 60);
  }
  
  void dead(){
    if (health <= 0){
      kill();
    }
   }
      
  //void display(){    
  // if (frameCount + 1 == localSprites.size()) frameCount = 0;
  // else frameCount++;
     
  // image(localSprites.get(frameCount), x, y);
   
  // if (health >= 100){
  //  image(hat, x, y - hat.height + 20);
  // }
   

  //}
}
