class Board{

Coordinate[][] board;
boolean[][] occupied;
ArrayList<ArrayList<Zombies>> zombieLanes;
ArrayList<ArrayList<Plant>> plantLanes;
int[][] allZombies;
int[] plantable;
int sunFrame;

  
  Board(){
    initializeBoard();
    initializeZombies();
    plantable = new int[7];
    occupied = new boolean[5][9];
    sunFrame = 0;
  }
 
  void initializeZombies(){
    allZombies = new int[25][3];
    Random r = new Random();
    for (int idx = 0; idx < allZombies.length; idx ++){
      int entryTime = r.nextInt(120);
      int type;
      if (entryTime <= 30) type = 0;
      else type = r.nextInt(3);
      int col = r.nextInt(5);
      allZombies[idx] = new int[] {entryTime, type, col};
    }
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
  
  void enterZombies(){
    Random r = new Random();
    int zombieRate;
    if (frameCount < 3600) zombieRate = 270;
    else zombieRate = 180;
    if (frameCount % zombieRate == 0){
      int type = r.nextInt(3);
      if (type == 0) makeGardenZombie(r.nextInt(5), 8);
      if (type == 1) makeConeZombie(r.nextInt(5), 8);
      if (type == 2) makeBucketZombie(r.nextInt(5), 8);
    }
    //for (int idx = 0; idx < allZombies.length; idx ++){
    //  if (allZombies[idx][0]*60 == frameCount){
    //    if (allZombies[idx][1] == 0) makeGardenZombie(allZombies[idx][2], 8);
    //    if (allZombies[idx][1] == 1) makeConeZombie(allZombies[idx][2], 8);
    //    if (allZombies[idx][1] == 2) makeBucketZombie(allZombies[idx][2], 8);
    //  }
    //}
  }
  
  void setPlantableValues(){
    for (int idx = 0; idx < plantable.length; idx ++){
      if (plantable[idx] != 0){
        if (idx < 3){
          if (plantable[idx] < 300) plantable[idx] ++;
          else plantable[idx] = 0;
        }
        else{
          if (plantable[idx] < 900) plantable[idx] ++;
          else plantable[idx] = 0;
        }
        tint(255, 200);
        if (idx == 0) image(tint, 69, 237);
        if (idx == 1) image(tint, 69, 137);
        if (idx == 2) image(tint, 69, 40);
        if (idx == 3) image(tint, 69, 632);
        if (idx == 4) image(tint, 69, 535);
        if (idx == 5) image(tint, 69, 435);
        if (idx == 6) image(tint, 69, 335);
        noTint();
      }
    }
  }
  
  Walnut makeWalnut(int r, int c){
    Walnut w = new Walnut(r, c, "walnut", 50);
    ListOfPlant.add(w);
    plantLanes.get(r).add(w);
    thingsToUpdate.add(w);
    thingsToDisplay.add(w);
    occupied[r][c] = true;
    sun -= 50;
    return w;
  }
  
 void makeSunSunflower(int r, int c){
    Sun s = new Sun(board[r][c].x + 55, board[r][c].y - 55, false);
    thingsToDisplay.add(s);
    thingsToUpdate.add(s);
    ListOfSun.add(s);
    suns.add(s);
    //print("made");
 }
 
 void makeSunSky(){
  if (frameCount % (60 * sunRate) == 0 && ListOfSun.size() < 10){
    Sun s = new Sun(r.nextInt(1300-380-30) + 410, 0, true);//r.nextInt(720-130) + 130);
    thingsToDisplay.add(s);
    suns.add(s);
    thingsToMove.add(s);
    sunFrame = 0;
    thingsToUpdate.add(s);
    ListOfSun.add(s);
  }
  sunFrame++;
}
  
  Peashooter makePea(int r, int c){
    Peashooter p = new Peashooter(r, c, "peashooter", 100);
    peashooters.add(p);
    thingsToDisplay.add(p);
    ListOfPlant.add(p);
    plantLanes.get(r).add(p);
    thingsToUpdate.add(p);
    occupied[r][c] = true;
    sun -= 100;
    return p;
  }
  
  CherryBomb makeCherryBomb(int r, int c){
    CherryBomb cb = new CherryBomb(r, c);
    //thingsToDisplay.add(cb);
    ListOfPlant.add(cb);
    //plantLanes.get(r).add(c);
    thingsToUpdate.add(cb);
    occupied[r][c] = true;
    sun -= 150;
    return cb;  
  }
  
  Sunflower makeSunflower(int r, int c){
    Sunflower s = new Sunflower(r, c);
    sunflowers.add(s);
    thingsToDisplay.add(s);
    ListOfPlant.add(s);
    plantLanes.get(r).add(s);
    thingsToUpdate.add(s);
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
    thingsToUpdate.add(z);
    return z;
  }
  
  ConeZombie makeConeZombie(int r, int c){
    ConeZombie z = new ConeZombie(r, c);
    zombieLanes.get(r).add(z);
    thingsToDisplay.add(z);
    ListOfZombies.add(z);
    thingsToMove.add(z);
    thingsToUpdate.add(z);
    return z;
  }
  
  BucketZombie makeBucketZombie(int r, int c){
    BucketZombie z = new BucketZombie(r, c);
    zombieLanes.get(r).add(z);
    thingsToDisplay.add(z);
    ListOfZombies.add(z);
    thingsToMove.add(z);
    thingsToUpdate.add(z);
    return z;
  }
  
  Snowpea makeSnowpea(int r, int c){
    Snowpea s = new Snowpea(r, c);
    thingsToDisplay.add(s);
    ListOfPlant.add(s);
    plantLanes.get(r).add(s);
    thingsToUpdate.add(s);
    occupied[r][c] = true;
    sun -= 175;
    return s;
  }
  
  Potato makePotato(int r, int c){
    Potato s = new Potato(r, c);
    thingsToDisplay.add(s);
    ListOfPlant.add(s);
    plantLanes.get(r).add(s);
    thingsToUpdate.add(s);
    occupied[r][c] = true;
    sun -= 25;
    return s;
  }
  
  Chomper makeChomper(int r, int c){
    Chomper s = new Chomper(r, c);
    thingsToDisplay.add(s);
    ListOfPlant.add(s);
    plantLanes.get(r).add(s);
    thingsToUpdate.add(s);
    occupied[r][c] = true;
    sun -= 150;
    return s;
  }
  
  boolean occupied(int r, int c){
    return occupied[r][c];
  }
  
  boolean mouseOn(){
    return (mouseX < 1285 && mouseX > 380 && mouseY < 715 && mouseY > 100);
  }
}
