abstract class LivingThing implements Displayable, Collideable{
  int health, row, col, x, y;
  String type;
  PImage image; 
  boolean alive;
  
  abstract void attack();
  //abstract void changeDisplay();
  
  void die(){
    alive = false;
  }
  
  LivingThing(int r, int c, int xcor, int ycor, String picture, String Type){
    row = r; col = c; x = xcor; y = ycor; image = loadImage(picture); alive = true; type = Type; 
    
  }
  
  void display(){
    image(image, x, y);
  }
  
  void modImage(int w, int h){
    image.resize(w, h);
  }
}
