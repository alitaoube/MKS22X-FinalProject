class Board{

Coordinate[][] board;
boolean[][] occupied;
ArrayList<ArrayList<Zombies>> zombieLanes;
  
  Board(){
    initializeBoard();
    occupied = new boolean[5][9];
  }
  
  void initializeBoard(){
    board = new Coordinate[5][9];
    zombieLanes = new ArrayList<ArrayList<Zombies>>();
    for (int idx = 0; idx < 5; idx ++){
      zombieLanes.add(new ArrayList<Zombies>());
    }
    fill(0, 0, 0);
    int x = 420;
    int y = 150;
    for (int idx = 0; idx < 5; idx ++){
      for (int idx2 = 0; idx2 < 9; idx2 ++){
        board[idx][idx2] = new Coordinate(x,y);
        //ellipse(x, y, 20, 20);
        x += 100;
        //ellipse(output[idx][idx2].getX(), output[idx][idx2].getY(), 20, 20);
      }
      y += 130;
      x = 420;
    }
  }
  
  Peashooter makePea(int r, int c){
    Peashooter p = new Peashooter(r, c, "normal", 100);
    occupied[r][c] = true;
    return p;
  }
  
  GardenZombie makeGardenZombie(int r, int c){
    GardenZombie z = new GardenZombie(r, c);
    zombieLanes.get(r).add(z);
    return z;
  }
  
  boolean occupied(int r, int c){
    return occupied[r][c];
  }
  
  boolean mouseOn(){
    return (mouseX < 1285 && mouseX > 380 && mouseY < 715 && mouseY > 100);
  }
}
