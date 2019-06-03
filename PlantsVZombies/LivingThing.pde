abstract class LivingThing implements Displayable, Collideable{
  int health, row, col;
  float x, y;
  String type;
  boolean alive;
  String name = "jeffrey";
  ArrayList<PImage> localSprites = new ArrayList<PImage>();
  int frameCount = 0;
  PImage image;
  
  //abstract void attack();
  //abstract void changeDisplay();
  
  void die(){
    alive = false;
  }
  
  LivingThing(int r, int c, String picture, String Type){
    Coordinate[][] backyard = board();
    row = r; col = c; alive = true; type = Type; 
        
    x = backyard[r][c].getX();
    textSize(100);
    //text(image.width + "", 500, 500);
    y = backyard[r][c].getY();

  }
  
  void display(){
    //image
    if (frameCount + 1 == localSprites.size()) frameCount = 0;
    else frameCount++;
    image = localSprites.get(frameCount);
      //delay(15);
    imageMode(CENTER);
    image(image, x, y);
  }
  
  String toString(){
    return name;
  }
  
  boolean inFront(LivingThing other){
    System.out.println(other.x > this.x);
   return (other.x > this.x);
  }  
  
  boolean isTouching(LivingThing other) {
    return inFront(other) && Math.abs(this.x - other.x) <= 60;
  }
}
