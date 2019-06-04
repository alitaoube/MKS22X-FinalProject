class CherryBomb extends Plant implements Updateable{
  
  //float xImgSize;
  //float yImgSize;
  boolean explode;
  boolean hasExploded;
  int explosionFrame;
  PImage image;
  
  CherryBomb(int r, int c){
    super(r, c, "images/cherrybomb.png", "CherryBomb", 150);
    explode = false;
    hasExploded = false;
    explosionFrame = frameCount;
    image = loadImage("images/cherrybomb.png");
    image.resize(100, 100);
  }
  
  void display(){
    if (!explode){
      imageMode(CENTER);
      image(image, x, y);
    }
    else{
      tint(0);
      imageMode(CENTER);
      image(image, x, y);
      noTint();
      //hasExploded = true;
    }
  }
    
  
  void update(){
    display();
    if (!explode){
      getBig();
      explosionFrame ++;
    }
    if (image.width > 150 && image.height > 150){
     explode = true; 
    }
    if (!hasExploded && explode) {exploding(); hasExploded = true;}
    if (hasExploded && explode){
      thingsToUpdate.remove(this);
      ListOfPlant.remove(this);
      backyard.occupied[row][col] = false;
    }
  }  

  void getBig(){
    image.resize(1 + image.width, 1 + image.height);
    //x -= .5;
    //y-= .5;
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
