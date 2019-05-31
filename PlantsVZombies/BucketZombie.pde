class BucketZombie extends Zombies{
  ArrayList<PImage> sprites;

  BucketZombie(int r, int c){
    super(r, c, "images/bucket.png", "cone", 300, 50);
    modImage(70, 120);
    y -= 20;
    sprites = new ArrayList<PImage>();
    sprites.add(loadImage("images/bucket.png"));
    sprites.add(loadImage("images/zombie.png"));
  }
  
  void move(){
    x-=.5;
  }
  
  void update(){
    move();
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
   
   void update(Plant plant){
    dead();
    float i = dist(this.x, this.y, plant.x, plant.y);
    if (i < 60){
      this.attack(plant);
    }
    else{
      this.move();
    }
   }
   
   
   void attack(Plant plant){
     plant.health -= 0;
   } 
}
