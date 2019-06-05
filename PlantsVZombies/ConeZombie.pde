class ConeZombie extends Zombies{
   PImage hat;
   
   ConeZombie(int r, int c){
   super(r, c, "images/cone.png", "cone", 200, 50);
   image = loadImage("images/cone.png");
   image.resize(80, 120);
   hat = loadImage("images/cone.png");
   hat.resize(50, 50);
   }
   
   void dead(){
    if (health <= 100 && health > 0){
      image = sprites.get(1);
      image.resize(70, 120);
    }
    if (health <= 0){
      kill();
    }
   }
   
   void display(){
     if (spriteFrame + 1 == localSprites.size()) spriteFrame = 0;
     else spriteFrame++;
     
     image(localSprites.get(spriteFrame), x, y);
     if (health >= 100){
       image(hat, x, y - hat.height);
     }
   }
}
