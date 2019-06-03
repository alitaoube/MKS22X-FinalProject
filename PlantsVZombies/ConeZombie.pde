class ConeZombie extends Zombies{
   PImage hat = loadImage("images/cone.png");
   ConeZombie(int r, int c){
   super(r, c, "images/cone.png", "cone", 300, 50);
   image = loadImage("images/cone.png");
   image.resize(80, 120);
   }
   
   void dead(){
    if (health <= 100 && health > 0){
      image = sprites.get(1);
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
     if (frameCount + 1 == localSprites.size()) frameCount = 0;
     else frameCount++;

     image(localSprites.get(frameCount), x, y);
     
     image(hat, x, y - hat.height);
   }
}
