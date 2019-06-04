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
    cherryFrame = frameCount;
    cherried = false;
  }
  
  void attack(Plant plant){
   plant.health -= 1; 
  }
  
void update(){
//<<<<<<< HEAD
  
  if (this.timer > 0) this.timer--;
  
  if (timer == 0){
   noTint();
   this.speed = 1;
  }
  else{
   tint(0, 153, 204);
   this.speed = .5;
  }
  
//=======
 // display();
//>>>>>>> genZombies
  if (x <= 370) gameOver = true;
  
  if (cherried){
    this.health = 0;
    tint(0); 
    display(); 
    noTint(); 
    return;
  }
  cherryFrame ++; 
  if (backyard.plantLanes.get(this.row).isEmpty()) this.move();
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

   void kill(){
     ListOfZombies.remove(this);
     thingsToDisplay.remove(this);
     thingsToUpdate.remove(this);
     thingsToMove.remove(this);
     backyard.zombieLanes.get(this.row).remove(this);
     removedFromList = true;
   }

  
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
 
 void move(){
  x-=1 * speed; 
 }
}
