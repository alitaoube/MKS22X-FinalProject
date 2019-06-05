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
      if (timer < 30){
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
    image.resize(1 + image.width, 1 + image.height);
    //x -= .5;
    //y-= .5;
  }
  
  void exploding(){
    for (int idx = 0; idx < ListOfZombies.size(); idx ++){
      Zombies z = ListOfZombies.get(idx);
      if (abs(dist(this.x, this.y, z.x, z.y)) < 200) {
          z.health = 0; z.cherried = true;
      }
    }
  }
  
  
  
}
