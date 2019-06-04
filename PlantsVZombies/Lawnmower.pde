class Lawnmower implements Updateable, Displayable{
  PImage image;
  float x, y;
  int row, col;
  boolean triggered;
  
  Lawnmower(){
    for (int x = 0; x < 5; x++){
     new Lawnmower(x, 0);
    }
  }
  
  Lawnmower(int r, int c){
    Coordinate[][] backyard = board();
    row = r; col = c;
    image = loadImage("images/lawnmower.png");
    image.resize(110, 100);
  

    x = backyard[r][c].getX() - image.width + 20;
    textSize(100);
    //text(image.width + "", 500, 500);
    y = backyard[r][c].getY() - 10;
    
    thingsToUpdate.add(this);
    thingsToDisplay.add(this);
    ListOfLawnmowers.add(this);
  }
  
  void display(){
   image(image, x, y);
  }
  
  void move(){
    x+=5;
  }
  
  boolean touchingZombie(){
    for (int idx = 0; idx < backyard.zombieLanes.get(this.row).size(); idx ++){
      Zombies z = backyard.zombieLanes.get(this.row).get(idx);
      if (z.x - this.x < 10) return true;
    }
    return false;
  }
  
  void update(){
   display();
   for (int i = 0; i < backyard.zombieLanes.get(this.row).size(); i++){
     Zombies z = backyard.zombieLanes.get(this.row).get(i);
     if (z.x - this.x <= 40) {
       z.kill();
       triggered = true;
   }
  }
   if (triggered == true) move();
}
}
