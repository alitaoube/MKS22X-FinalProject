class Board{
  
  Board(){}
  
  Coordinate[][] board(){
    Coordinate[][] output = new Coordinate[5][9];
    fill(0, 0, 0);
    int x = 420;
    int y = 150;
    for (int idx = 0; idx < 5; idx ++){
      for (int idx2 = 0; idx2 < 9; idx2 ++){
        ellipse(x, y, 20, 20);
        x += 100;
      }
      y += 130;
      x = 420;
    }
    return output;
  }
}
