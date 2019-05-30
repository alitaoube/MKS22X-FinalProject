class ConeZombie extends Zombies{
  ArrayList<PImage> sprites;
   ConeZombie(int r, int c){
   super(r, c, "images/cone.jpg", "cone", 300, 50);
   modImage(70, 120);
   y -= 20;
   sprites = new ArrayList<PImage>();
   sprites.add(loadImage("images/cone.jpg"));
   sprites.add(loadImage("images/zombie.png"));
   }
   
   void move(){
     x-=.5;
   }
   
   
   void attack(Plant plant){
     plant.health -= 0;
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
 
  boolean isTouching(LivingThing other){
   return ((Math.sqrt(Math.pow(this.x - other.x, 2) + Math.pow(this.y - other.y, 2))) <= 50);
   }
   
}
