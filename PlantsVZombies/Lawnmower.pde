class Lawnmower implements Updateable, Displayable{
  PImage image;
  float x, y;
  int row, col;
  boolean triggered;
  
  Lawnmower(){
    for (int x = 0; x < 5; x++){
      // creates one lawnmower at each position across the side of the screen
     new Lawnmower(x, 0);
    }
  }
  
  Lawnmower(int r, int c){
    Coordinate[][] backyard = board();
    row = r; col = c;
    image = loadImage("images/lawnmower.png");
    image.resize(110, 100);
  
    // makes one specific lawnmower at the designated position. It makes it slightly before the 0th position in that row so that you can still put plants there
    x = backyard[r][c].getX() - image.width + 20;
    textSize(100);
    //text(image.width + "", 500, 500);
    y = backyard[r][c].getY() - 10;
    
    thingsToUpdate.add(this);
    thingsToDisplay.add(this);
    ListOfLawnmowers.add(this);
  }
  
  void display(){
   noTint();
   image(image, x, y);
  }
  
  void move(){
    x+=5;
  }
  
  void update(){
   display();
   
   // if it goes past the end of the screen, it gets deleted to prevent it from interfering with any zombies made in the future
   if (y > 1350){
    thingsToUpdate.remove(this);
    thingsToDisplay.remove(this);
    ListOfLawnmowers.remove(this);

   }
   
   // loops through all zombies in that specific row
   for (int i = 0; i < backyard.zombieLanes.get(this.row).size(); i++){
     Zombies z = backyard.zombieLanes.get(this.row).get(i);
     if (Math.abs(z.x - this.x) <= 40) {
       z.kill();
       triggered = true;
   }
  }
  // if it has been triggered it travels across the row
   if (triggered == true) move();
}
}
