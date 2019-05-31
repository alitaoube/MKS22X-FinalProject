abstract class Zombies extends LivingThing implements Moveable, Collideable{
  int health;
  int speed;

  Zombies(int r, int c, String picture, String type, int hp, int spd){
    super(r,  c, picture, type);
    health = hp;
    speed = spd;
  }
  
  void attack(Plant plant){
   plant.health -= 5; 
  }
  
  void update() {
    dead();
    if (backyard.plantLanes.get(this.row).isEmpty()) this.move();
    else {
      boolean hasAttacked = false;
      boolean isTouching = false;
      for (int idx = backyard.plantLanes.get(this.row).size() - 1; idx >= 0; idx --){
        Plant maybeAttack = backyard.plantLanes.get(this.row).get(idx);
        isTouching = this.isTouching(maybeAttack);
        if (isTouching) {
          this.attack(maybeAttack);
          hasAttacked = true;
        }
      }
      if (!hasAttacked) this.move();
    }
  }
  
  void dead(){
    if (health <= 0){
       ListOfZombies.remove(this);
       thingsToDisplay.remove(this);
       thingsToMove.remove(this);
       backyard.zombieLanes.get(this.row).remove(this);
    }
 }
 
 void move(){
  x-=1; 
 }
}
