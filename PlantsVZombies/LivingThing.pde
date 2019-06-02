abstract class LivingThing implements Displayable, Collideable{
  int health, row, col;
  float x, y;
  String type;
  PImage image;
  boolean alive;
  String name = "jeffrey";
  ArrayList<PImage> localSprites = new ArrayList<PImage>();
  int frameCount = 0;
  
  //abstract void attack();
  //abstract void changeDisplay();
  
  void die(){
    alive = false;
  }
  
  LivingThing(int r, int c, String picture, String Type){
    Coordinate[][] backyard = board();
    row = r; col = c; alive = true; type = Type; 
    modImage(75, 75);
    x = backyard[r][c].getX() - (image.width)/2;
    textSize(100);
    //text(image.width + "", 500, 500);
    y = backyard[r][c].getY() - image.height/2;
    
    for (int x = 0; x < spriteNames.length; x++){
      System.out.println("images/" + spriteNames[x] + ".png");
     if (spriteNames[x].contains(type)) localSprites.add(sprites.get(x));
    }
  }
  
  void display(){
    //image
    if (frameCount + 1 == sprites.size()) frameCount = 0;
    else frameCount++;
    image = sprites.get(frameCount);
    image(image, x, y);
  }
  
  void modImage(int w, int h){
    image.resize(w, h);
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
