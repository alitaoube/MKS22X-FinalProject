//abstract class for the zombies
abstract class Zombies extends LivingThing implements Moveable, Collideable, Updateable{
  int health;
  float speed;
  int cherryFrame;
  boolean cherried;
  boolean blue;
  int timer;

  Zombies(int r, int c, String picture, String type, int hp, float spd){
    super(r,  c, type);
    
    for (int x = 0; x < spriteNames.length; x++){
     if (spriteNames[x].contains("zombie")) localSprites.add(sprites.get(x));
    }
    
    health = hp;
    speed = spd;
    //tracks whether or not the zombie is killed by a cherry
    cherryFrame = frameCount;
    cherried = false;
  }
  
  //method to lower the plants health.
  void attack(Plant plant){
   plant.health -= 1; 
  }

//update method for zombies
void update(){
  //timer is used to track how long the zombie is going to be slow for if it is hit by the snow pea.
  if (this.timer > 0) this.timer--;
  
  if (timer == 0){
   noTint();
   this.speed = 1;
  }
  else{
   //makes the zombie blue and slow if hit by a snow pea.
   tint(0, 153, 204);
   this.speed = .5;
  }
  
  if (x <= 350) gameOver = true;
  //attempted animation for when the zombie gets hit with a cherry bomb.
  //not functional because it was replaced with the spudow picture.
  if (cherried){
    this.health = 0;
    tint(0); 
    display(); 
    noTint(); 
    return;
  }
  cherryFrame ++; 
  if (backyard.plantLanes.get(this.row).isEmpty()) this.move();
  //finds out if it's touching a plant and attacks it if it is.
  else {
    boolean hasAttacked = false;
    boolean isTouching = false;
    for (int idx = backyard.plantLanes.get(this.row).size() - 1; idx >= 0; idx --){
      Plant maybeAttack = backyard.plantLanes.get(this.row).get(idx);
      isTouching = maybeAttack.isTouching(this);
      if (isTouching) {
        this.attack(maybeAttack);
        hasAttacked = true;
      }
    }
    if (!hasAttacked) this.move();
  }
}
   //method to kill zombies
   void kill(){
     ListOfZombies.remove(this);
     thingsToDisplay.remove(this);
     thingsToUpdate.remove(this);
     thingsToMove.remove(this);
     backyard.zombieLanes.get(this.row).remove(this);
     removedFromList = true;
   }

//method to have zombies die if their health is 0;
void dead(){
  if (health <= 0){
     ListOfZombies.remove(this);
     thingsToDisplay.remove(this);
     thingsToMove.remove(this);
     backyard.zombieLanes.get(this.row).remove(this);
     if (!cherried) thingsToUpdate.remove(this);
     removedFromList = true;
  }
}
 //has zomnbies move closer to the plants
 void move(){
  x-=1 * speed; 
 }
}
