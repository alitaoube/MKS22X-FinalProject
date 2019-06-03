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
    image = loadImage("images/lawnmower.png");
    image.resize(110, 100);
  

    x = backyard[r][c].getX() - image.width + 20;
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
    
   if (Math.abs(backyard.zombieLanes.get(this.row).get(0).x - this.x) <= 40){
     triggered = true;
   }
   if (triggered == true) x+=1;
  }
}
