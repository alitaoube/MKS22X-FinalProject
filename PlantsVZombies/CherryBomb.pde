class CherryBomb extends Plant implements Updateable{
  
  float xImgSize;
  float yImgSize;
  
  CherryBomb(int r, int c){
    super(r, c, "images/cherrybomb.jpg", "CherryBomb", 150);
  }
  
  void update(){
    display();
    getBig();
  }
  
  //void getBig(){modImage((int)(1.2*image.width), (int)(1.01*image.height));}
  void getBig(){
    modImage(1 + image.width, 1 + image.height);
    x -= .5;
    y-= .5;
    //x = backyard.board[r][c].getX() - (image.width)/2;
    //y = backyard.board[r][c].getY() - (image.width)/2;
  }
}
