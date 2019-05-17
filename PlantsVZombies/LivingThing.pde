abstract class LivingThing implements displayable{
  int health, row, col, x, y;
  PImage image;
  boolean alive;
  
  abstract void attack();
  abstract void display();
  abstract void changeDisplay();
  
  void die(){
    alive = false;
  }
  
  LivingThing(int r, int c, int xcor, int ycor, String picture){
    row = r; col = c; x = xcor; y = ycor; image = loadImage(picture); alive = true;
  }
}