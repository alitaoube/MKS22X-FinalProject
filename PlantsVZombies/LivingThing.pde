abstract class LivingThing implements Displayable, Collideable{
  int health, row, col;
  float x, y;
  String type;
  boolean alive;
  ArrayList<PImage> localSprites = new ArrayList<PImage>();
  //int frameCount = 0;
  PImage image;
  int spriteFrame;
  //abstract void attack();
  //abstract void changeDisplay();
  
  void die(){
    alive = false;
  }
  
  LivingThing(int r, int c, String Type){
    row = r; col = c; alive = true; type = Type; 
    spriteFrame = 0;
    // creates the object at the coordinate position previously described
    x = backyard.board[r][c].getX();
    y = backyard.board[r][c].getY();

  }
  
  void display(){
    // if the next frame does not exist, go back to the beginning
    if (spriteFrame + 1 == localSprites.size()) spriteFrame = 0;
    else spriteFrame ++;
    if (localSprites.size() > 0){
      // switch to the next frame
      image = localSprites.get(spriteFrame);
      //delay(15);
    }
    imageMode(CENTER);
    image(image, x, y);
  }
  
  // to prevent zombies from stopping due to objects behind them
  boolean inFront(LivingThing other){
   return (other.x > this.x);
  }  
  
  // checks if the object is in front of it and the distance is close enough
  boolean isTouching(LivingThing other) {
    return inFront(other) && Math.abs(this.x - other.x) <= 60;
  }
}
