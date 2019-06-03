class Lawnmower{
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
  }
  
  void display(){
   image(image, x, y);
  }
}
