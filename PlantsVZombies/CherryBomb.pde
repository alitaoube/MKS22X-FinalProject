class CherryBomb extends Plant implements Updateable{
  
  //float xImgSize;
  //float yImgSize;
  boolean explode;
  boolean hasExploded;
  int explosionFrame;
  
  CherryBomb(int r, int c){
    super(r, c, "images/cherrybomb.jpg", "CherryBomb", 150);
    explode = false;
    hasExploded = false;
    explosionFrame = frameCount;
  }
  
  void display(){
    if (!explode) super.display();
    else{
      tint(0);
 super.display(); noTint();
    }
  }
    
  
  void update(){
    display();
    if (!explode){
      getBig();
      explosionFrame ++;
    }
    if (image.width > 150 && image.height > 150) explode = true;
    if (!hasExploded && explode) {exploding(); hasExploded = true;}
    if (hasExploded && explode && ((explosionFrame + 90) < frameCount)){
      thingsToUpdate.remove(this);
      ListOfPlant.remove(this);
      backyard.occupied[row][col] = false;
    }
  }  

  void getBig(){
    modImage(1 + image.width, 1 + image.height);
    x -= .5;
    y-= .5;
  }
  
  void exploding(){
    for (int idx = 0; idx < ListOfZombies.size(); idx ++){
      Zombies z = ListOfZombies.get(idx);
      float myX = backyard.board[this.row][this.col].getX();
      float myY = backyard.board[this.row][this.col].getY();
      if (abs(dist(this.x, this.y, z.x, z.y)) < 200) {z.health = 0; z.cherried = true;}
    }
  }
  
  
  
}
