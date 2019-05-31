class ConeZombie extends Zombies{
  ArrayList<PImage> sprites;
   ConeZombie(int r, int c){
   super(r, c, "images/cone.png", "cone", 300, 50);
   modImage(70, 120);
   y -= 20;
   sprites = new ArrayList<PImage>();
   sprites.add(loadImage("images/cone.png"));
   sprites.add(loadImage("images/zombie.png"));
   }
   
   void dead(){
    if (health <= 100 && health > 0){
      image = sprites.get(1);
      modImage(70, 120);
    }
    if (health <= 0){
     ListOfZombies.remove(this);
     thingsToDisplay.remove(this);
     thingsToMove.remove(this);
     backyard.zombieLanes.get(this.row).remove(this);

    }
   }   
}
