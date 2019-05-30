class Board{

Coordinate[][] board;
boolean[][] occupied;
ArrayList<ArrayList<Zombies>> zombieLanes;
ArrayList<ArrayList<Plant>> plantLanes;

  
  Board(){
    initializeBoard();
    occupied = new boolean[5][9];
  }
  
  void initializeBoard(){
    board = new Coordinate[5][9];
    zombieLanes = new ArrayList<ArrayList<Zombies>>();
    plantLanes = new ArrayList<ArrayList<Plant>>();
    for (int idx = 0; idx < 5; idx ++){
      zombieLanes.add(new ArrayList<Zombies>());
      plantLanes.add(new ArrayList<Plant>());
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
  
  void makeSun(int r, int c){
    Sun s = new Sun(board[r][c].x + 10, board[r][c].y - 10);
    thingsToDisplay.add(s);
    suns.add(s);
 }
  
  Peashooter makePea(int r, int c){
    Peashooter p = new Peashooter(r, c, "normal", 100);
    peashooters.add(p);
    thingsToDisplay.add(p);
    ListOfPlant.add(p);
    occupied[r][c] = true;
    sun -= 100;
    return p;
  }
  
  Sunflower makeSunflower(int r, int c){
    Sunflower s = new Sunflower(r, c);
    sunflowers.add(s);
    thingsToDisplay.add(s);
    ListOfPlant.add(s);
    occupied[r][c] = true;
    sun -= 50;
    return s;
  }
  
  GardenZombie makeGardenZombie(int r, int c){
    GardenZombie z = new GardenZombie(r, c);
    zombieLanes.get(r).add(z);
    thingsToDisplay.add(z);
    ListOfZombies.add(z);
    thingsToMove.add(z);
    return z;
  }
  
  ConeZombie makeConeZombie(int r, int c){
    ConeZombie z = new ConeZombie(r, c);
    zombieLanes.get(r).add(z);
    thingsToDisplay.add(z);
    ListOfZombies.add(z);
    thingsToMove.add(z);
    return z;
  }
  
  BucketZombie makeBucketZombie(int r, int c){
    BucketZombie z = new BucketZombie(r, c);
    zombieLanes.get(r).add(z);
    thingsToDisplay.add(z);
    ListOfZombies.add(z);
    thingsToMove.add(z);
    return z;
  }
  
  boolean occupied(int r, int c){
    return occupied[r][c];
  }
  
  boolean mouseOn(){
    return (mouseX < 1285 && mouseX > 380 && mouseY < 715 && mouseY > 100);
  }
}
