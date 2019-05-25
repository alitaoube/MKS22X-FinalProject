abstract class LivingThing implements Displayable, Collideable{
  int health, row, col;
  float x, y;
  String type;
  PImage image; 
  boolean alive;
  String name = "jeffrey";
  
  //abstract void attack();
  //abstract void changeDisplay();
  
  void die(){
    alive = false;
  }
  
  LivingThing(int r, int c, String picture, String Type){
    Coordinate[][] backyard = board();
    row = r; col = c; image = loadImage(picture); alive = true; type = Type; 
    modImage(75, 75);
    x = backyard[r][c].getX() - (image.width)/2;
    textSize(100);
    //text(image.width + "", 500, 500);
    System.out.println(image.height);
    y = backyard[r][c].getY() - image.height/2;
  }
  
  void display(){
    image(image, x, y);
  }
  
  void modImage(int w, int h){
    image.resize(w, h);
  }
  
  String toString(){
    return name;
  }
}
