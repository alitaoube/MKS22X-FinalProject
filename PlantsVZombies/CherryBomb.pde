class CherryBomb extends Plant implements Updateable{
  
  float xImgSize;
  float yImgSize;
  
  CherryBomb(int r, int c){
    super(r, c, "cherrybomb.jpg", "CherryBomb", 150);
  }
  
  void update(){
    display();
  }
}
