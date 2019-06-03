class ConeZombie extends Zombies{
   ConeZombie(int r, int c){
   super(r, c, "images/cone.png", "cone", 300, 50);
   image = loadImage("images/cone.png");
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
     image(image, x, y);
   }
}
