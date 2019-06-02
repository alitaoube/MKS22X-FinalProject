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
  
  void   die(){
    alive = false;
  }
  
  LivingThing(int r, int c, String picture, String Type){
    Coordinate[][] backyard = board();
    row = r; col = c; alive = true; type = Type; 
    
    for (int x = 0; x < spriteNames.length; x++){
      System.out.println(type);
      if (spriteNames[x].contains(type))
      {localSprites.add(sprites.get(x));
      }
      if (localSprites.size() > 0){
       image = localSprites.get(0);
      }
      else{
        image = loadImage(picture);
      }
    }    
    x = backyard[r][c].getX() - (image.width)/2;
    textSize(100);
    //text(image.width + "", 500, 500);
    y = backyard[r][c].getY() - image.height/2;

  }
  
  void display(){
    //image
    if (frameCount + 1 == localSprites.size()) frameCount = 0;
    else frameCount++;
    if (localSprites.size() > 0){
      image = localSprites.get(frameCount);
      modImage(75, 75);
      delay(15);

    }
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
