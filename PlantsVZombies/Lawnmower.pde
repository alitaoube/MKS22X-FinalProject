class Lawnmower implements Updateable, Displayable{
  PImage image;
  float x, y;
  int row, col;
  boolean triggered;
  
  //Lawnmower(){
  //  for (int x = 0; x < 9; x++){
  //   Lawnmower(x, 0);
  //  }
  //}
  
  Lawnmower(int r, int c){
    Coordinate[][] backyard = board();
    row = r; col = c;
    image = loadImage("lawnmower.png");

    x = backyard[r][c].getX() - 50;
    textSize(100);
    //text(image.width + "", 500, 500);
    y = backyard[r][c].getY();
    
    thingsToUpdate.add(this);
    thingsToDisplay.add(this);
  }
  
  void display(){
   image(image, x, y);
  }
  
  void update(){
    
   if (backyard.zombieLanes.get(this.row).get(0).row == 0){
     triggered = true;
   }
   if (triggered == true) x+=1;
  }
}
