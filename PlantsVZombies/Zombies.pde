abstract class Zombies extends LivingThing implements Moveable, Collideable{
  int health;
  int speed;

  Zombies(int r, int c, String picture, String type, int hp, int spd){
    super(r,  c, picture, type);
    health = hp;
    speed = spd;
  }
  
  abstract void move();
  abstract void attack(Plant plant);
  abstract void update(Plant plant);
}
