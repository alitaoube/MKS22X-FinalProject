abstract class Zombies extends LivingThing implements Moveable{
  int health;
  int speed;

  Zombies(int r, int c, int xcor, int ycor, String picture, String type, int hp, int spd){
    super(r,  c,  xcor, ycor, picture, type);
    health = hp;
    speed = spd;
  }
  
  abstract void move();
  abstract void attack();
}
