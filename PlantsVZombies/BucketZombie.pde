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
      
  void display(){    
   if (spriteFrame + 1 == localSprites.size()) spriteFrame = 0;
   else spriteFrame++;
  
   image(localSprites.get(spriteFrame), x, y);
   
   // you have to overload the method so you can place the helmet on top of the gardenZombie
   if (health >= 100){
    image(hat, x, y - hat.height + 20);
   }
  }   


}
