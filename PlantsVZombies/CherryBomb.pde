class CherryBomb extends Plant implements Updateable{
  
  boolean explode;
  boolean hasExploded;
  int explosionFrame, timer;
  PImage image, powie;
  
  CherryBomb(int r, int c){
    super(r, c, "CherryBomb", 150);
    explode = false;
    hasExploded = false;
    explosionFrame = frameCount;
    image = loadImage("images/cherrybomb.png");
    image.resize(100, 100);
    powie = loadImage("images/powie.png");
  }
  
  void display(){
    if (!explode){
      imageMode(CENTER);
      image(image, x, y);
    }
    else{
      imageMode(CENTER);
      image(image, x, y);
      // remove the tint when it explodes
      noTint();
    }
  }
    
  
  void update(){
    display();
    if (!explode){
      // if it hasn't yet exploded, increase the size and increase the frame
      getBig();
      explosionFrame ++;
    }
    // once the size is great enough, toggle the explode
    if (image.width > 150 && image.height > 150){
     explode = true; 
    }
    // this checks to see when / if it should getBig()
    if (!hasExploded && explode) {exploding(); hasExploded = true;}
    if (hasExploded && explode){
      if (timer < 30){
        // this toggles the "powie" image for a short period of time
        image = powie;
        timer++;
      }
      else{
        thingsToUpdate.remove(this);
        ListOfPlant.remove(this);
        backyard.occupied[row][col] = false;
      }
    }
}  

  void getBig(){
    // simply increases the size of the cherry
    image.resize(1 + image.width, 1 + image.height);
  }
  
  void exploding(){
    // this checks to see if any nearby zombies should cause the cherry to explode
    for (int idx = 0; idx < ListOfZombies.size(); idx ++){
      Zombies z = ListOfZombies.get(idx);
      if (abs(dist(this.x, this.y, z.x, z.y)) < 200) {
          z.health = 0; z.cherried = true;
      }
    }
  }
  
  
  
}
