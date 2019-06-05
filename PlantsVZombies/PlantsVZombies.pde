//plants.jpg: 69x338
//sun.jpg: 198x64
//green starts: 380, 100. green ends: 1300, 720
import java.util.Random;

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
ArrayList<Sun> suns;
ArrayList<Peashooter> peashooters;
ArrayList<Plant> ListOfPlant;
ArrayList<Zombies> ListOfZombies;
ArrayList<Sun> ListOfSun;
ArrayList<Pea> peas;
ArrayList<Sunflower> sunflowers;
ArrayList<Updateable> thingsToUpdate;
ArrayList<Lawnmower> ListOfLawnmowers;
int sun, sunRate;
Random r;
PImage board, gardenZomb, coneZomb, bucketZomb;
boolean selected;
String selectedPlant;
boolean gameOver;
Board backyard;
String[] spriteNames;
ArrayList<PImage> sprites;
//<<<<<<< HEAD
boolean removedFromList;
//=======
Shovel s;
PImage tint;
String mode;
PImage home;
PImage mainmenu;
PImage menu;

void setup(){
  frameRate(60);
//<<<<<<< HEAD
  sun = 10000;
//=======
//>>>>>>> 9a9b9ff160f3cebe5a75000e8493e40cd28bf302
  sunRate = 1;
  backyard = new Board();
  tint = loadImage("images/tintsquare.png");
  tint.resize(130,  75);
  home = loadImage("images/homescreen.JPG");
  mainmenu = loadImage("images/mainmenu.png");
  mode = "home";
  menu = loadImage("images/menu.jpg");
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  thingsToUpdate = new ArrayList<Updateable>();
  ListOfZombies = new ArrayList<Zombies>();
  ListOfPlant = new ArrayList<Plant>();
  ListOfSun = new ArrayList<Sun>();
  ListOfLawnmowers = new ArrayList<Lawnmower>();
  suns = new ArrayList<Sun>();
  peashooters = new ArrayList<Peashooter>();
  peas = new ArrayList<Pea>();
  sunflowers = new ArrayList<Sunflower>();
  spriteNames = loadStrings("spriteNames.txt");
  sprites = new ArrayList<PImage>();
  gardenZomb = loadImage("images/zombie1.png");
  coneZomb = loadImage("images/coneZomb.png");
  bucketZomb = loadImage("images/bucketZomb.png");
  new Lawnmower(); // There isn't a need to store the lawnmowers because the constructor just makes all 5 lawnmowers and places them, and adds them to update list
  removedFromList = false;
  s = new Shovel();
  for (int x = 0; x < spriteNames.length; x++){
    sprites.add(loadImage("images/" + spriteNames[x] + ".png"));
  }
  
  r = new Random();
  size(1334, 750);
  board = loadImage("images/board.jpg");
  backyard.makeGardenZombie(0, 8);
  backyard.makeConeZombie(0, 6);
  backyard.makeBucketZombie(0, 7);
} 

void draw(){
  if (mode.equals("home")){
    background(home);
    displayMouse();
    startGame();
    return;
  }
  if (mode.equals("menu")){
    background(237, 236, 225);
    imageMode(CENTER);
    image(mainmenu, width/2, height/2);
    displayMouse();
    startGame();
    return;
  }
  if (mode.equals("adventure")){
    sunRate = 7;
    startGame();
    noTint();
    background(board);
    displaySun();
    displayPlantsBar();
    displayMouse();
    collectSun();
    backyard.makeSunSky();
    selectPlant();
    placePlant();
    backyard.enterZombies();
    imageMode(CORNER);
    image(menu, width - 119, 0);
    gameOver();
    imageMode(CENTER);
    for (int x = 0; x < ListOfPlant.size(); x++){
      ListOfPlant.get(x).display(); 
      ListOfPlant.get(x).update();
    }
    for (int x = ListOfSun.size() - 1; x >= 0; x--){
      ListOfSun.get(x).update(); 
      ListOfSun.get(x).display(); 
    }
    for (int x = ListOfZombies.size() - 1; x >= 0 ; x--){
      ListOfZombies.get(x).update();
      ListOfZombies.get(x).display();
      ListOfZombies.get(x).dead();
    }
    for (int x = 0; x < peas.size(); x++){
      peas.get(x).display();
      peas.get(x).update(); 
    }
    if (!gameOver) backyard.setPlantableValues();
    if (!gameOver){
      for (int x = 0; x < ListOfLawnmowers.size(); x++){
        ListOfLawnmowers.get(x).display();
        ListOfLawnmowers.get(x).update();
      }
      s.update();
      s.display();
    }

    return;
  }
//<<<<<<< HEAD
  if (mode.equals("demo")){
    sun = 10000;
    startGame();
    noTint();
    background(board);
    displaySun();
    displayPlantsBar();
    displayMouse();
    collectSun();
    backyard.makeSunSky();
    selectPlant();
    placePlant();
    imageMode(CORNER);
    image(menu, width - 119, 0);
    imageMode(CENTER);
    gardenZomb.resize(100, 100);
    coneZomb.resize(100, 100);
    bucketZomb.resize(100, 100);
    
    image(gardenZomb, 500, 40);
    image(coneZomb, 600, 40);
    image(bucketZomb, 700, 40);

    for (int x = 0; x < ListOfPlant.size(); x++){
      ListOfPlant.get(x).display(); 
      ListOfPlant.get(x).update();
    }
    for (int x = ListOfSun.size() - 1; x >= 0; x--){
      ListOfSun.get(x).update(); 
      ListOfSun.get(x).display(); 
    }
    for (int x = ListOfZombies.size() - 1; x >= 0 ; x--){
      ListOfZombies.get(x).update();
      ListOfZombies.get(x).display();
      ListOfZombies.get(x).dead();
    }
    for (int x = 0; x < peas.size(); x++){
      peas.get(x).display();
      peas.get(x).update(); 
    }
    if (!gameOver){
      for (int x = 0; x < ListOfLawnmowers.size(); x++){
        ListOfLawnmowers.get(x).display();
        ListOfLawnmowers.get(x).update();
      }
      s.update();
      s.display();
    }

    return;
  }
}
void startGame(){
  if (mode.equals("home")){
    if (mouseX < 915 && mouseX > 410 && mouseY < 725 && mouseY > 660 && mousePressed) mode = "menu";
  }
  if (mode.equals("menu")){
    if (mouseX < 900 && mouseX > 400 && mouseY < 460 && mouseY > 330 && mousePressed) mode = "demo";
    else if (mouseX < 920 && mouseX > 400 && mouseY < 290 && mouseY > 170 && mousePressed){
      sun = 200;
      mode = "adventure";
    }
  }
  if (mode.equals("adventure") || mode.equals("demo")){
    if (mouseX > 1220 && mouseY < 35 && mousePressed)  {mode = "menu"; clearLists();}
  }
}

void clearLists(){
  thingsToDisplay.clear();
  thingsToMove.clear();
  suns.clear();
  peashooters.clear();
  ListOfPlant.clear();
  ListOfZombies.clear();
  ListOfSun.clear();
  peas.clear();
  sunflowers.clear();
  thingsToUpdate.clear();
  ListOfLawnmowers.clear();
  backyard.occupied = new boolean[5][9];
  for (int idx = 0; idx < backyard.plantLanes.size(); idx ++){
    backyard.plantLanes.get(idx).clear();
    backyard.plantLanes.get(idx).clear();
  }
  backyard.plantable = new int[7];
}

void selectPlant(){
  // if the mouse is pressed and is in the appropriate position, it selects the applicable plant (or shovel)
  if (mousePressed && mouseX > 10 && mouseX < 135 && mouseY < 675){
    selected = true;
    if (mouseY > 610 && mouseY < 680 && sun >= 150 && backyard.plantable[3] == 0) {selectedPlant = "chomper"; return;}
    if (mouseY > 510 && mouseY < 580 && sun >= 25 && backyard.plantable[4] == 0) {selectedPlant = "potato"; return;}
    if (mouseY > 410 && mouseY < 480 && sun >= 150 && backyard.plantable[5] == 0) {selectedPlant = "cherry"; return;}
    if (mouseY > 310 && mouseY < 380 && sun >= 50 && backyard.plantable[6] == 0) {selectedPlant = "walnut"; return;}
    if (mouseY > 210 && mouseY < 280 && sun >= 175 && backyard.plantable[0] == 0) {selectedPlant = "snowpea"; return;}
    if (mouseY > 110 && mouseY < 180 && sun >= 100 && backyard.plantable[1] == 0) {selectedPlant = "peashooter"; return;}
    if (mouseY > 10 && mouseY < 80 && sun >= 50  && backyard.plantable[2] == 0) {selectedPlant = "sunflower"; return;}
    selected = false;
  }
  else if (mousePressed && mouseY > 0 && mouseY < 80 && mouseX < 430){selectedPlant = "shovel"; s.selected = true; return;}
  else if (mousePressed && mouseY > 0 && mouseY < 80 && mouseX > 450 && mouseX < 520){selected = true; selectedPlant = "garden"; return;}
  else if (mousePressed && mouseY > 0 && mouseY < 80 && mouseX > 550 && mouseX < 620){selected = true; selectedPlant = "cone"; return;}
  else if (mousePressed && mouseY > 0 && mouseY < 80 && mouseX > 650 && mouseX < 730){selected = true; selectedPlant = "bucket"; return;}
}

void placePlant(){
  // this places a plant based on what is selected using selectPlant
  if (!(selected && mousePressed && backyard.mouseOn())) return;
  // if you are no longer clicking, or click something else, or aren't on the board, you exit
  int r = 0; int c = 0;
  float minDistance = dist(mouseX, mouseY, backyard.board[0][0].x, backyard.board[0][0].y);
  for (int idx = 0; idx < backyard.board.length; idx ++){
    for (int idx2 = 0; idx2 < backyard.board[0].length; idx2 ++){
      float dis = dist(mouseX, mouseY, backyard.board[idx][idx2].x, backyard.board[idx][idx2].y);
      if (dis < minDistance){
        minDistance = dis;
        r = idx; c = idx2;
      }
    }
  }
  // create a plant (or shovel) based on what was selected in selectPlant
  if (selectedPlant.equals("peashooter") && !backyard.occupied(r, c)){
    backyard.makePea(r, c);
    backyard.plantable[1] = 1;
    selected = false;
  }
  else if (selectedPlant.equals("sunflower") && !backyard.occupied(r, c)){
    backyard.makeSunflower(r, c);
    backyard.plantable[2] = 1;
    selected = false;
  }
  else if (selectedPlant.equals("walnut") && !backyard.occupied(r, c)){
    backyard.makeWalnut(r, c);
    backyard.plantable[6] = 1;
    selected = false;
  }
  else if (selectedPlant.equals("cherry") && !backyard.occupied(r, c)){
    backyard.makeCherryBomb(r, c);
    backyard.plantable[5] = 1;
    selected = false;
  }
  else if (selectedPlant.equals("snowpea") && !backyard.occupied(r, c)){
    backyard.makeSnowpea(r, c);
    backyard.plantable[0] = 1;
    selected = false;
  }
  else if (selectedPlant.equals("potato") && !backyard.occupied(r, c)){
    backyard.makePotato(r, c);
    backyard.plantable[4] = 1;
    selected = false;
  }
  else if (selectedPlant.equals("chomper") && !backyard.occupied(r, c)){
    backyard.makeChomper(r, c);
    backyard.plantable[3] = 1;
    selected = false;
  }
  else if (selectedPlant.equals("shovel") && backyard.occupied(r, c)){
    s.selected = true;
    selected = false;
  }
  else if (selectedPlant.equals("garden")){
    backyard.makeGardenZombie(r, c);
    selected = false;
  }
  else if (selectedPlant.equals("cone")){
    backyard.makeConeZombie(r, c);
    selected = false;
  }
  else if (selectedPlant.equals("bucket")){
    backyard.makeBucketZombie(r, c);
    selected = false;
  }
}

void displaySun(){
  //PFont font = createFont("pvz.ttf", 32);
  // display the sun image
  PImage Sun = loadImage("images/sun.jpg");  
  noTint();
  imageMode(CENTER);
  image(Sun, Sun.width /2 + 138 + 11, Sun.height / 2 + 7);
  // cover it with a rectangle so we can overlay how much sun you have left
  fill(252, 237, 178);
  rect(210, 11, 130, 50);
  //textFont(font);
  fill(0, 0, 0);
  // cover the rectangle with the amount of sun you have
  text(sun + "", 240, 48);
}

void displayPlantsBar(){
  PImage Plants = loadImage("images/plants.jpg");
  Plants.resize(138, 676);
  image(Plants, Plants.width / 2, Plants.height / 2);
}
  
void displayMouse(){
  textSize(15);
  if (mouseX < 600 && mouseY > 300){
    text("X: " + mouseX + "  Y: " + mouseY, mouseX + 100, mouseY - 20);
  }
  else if (mouseX < 600 && mouseY < 300){
    text("X: " + mouseX + "  Y: " + mouseY, mouseX + 100, mouseY + 20);
  }
  else if (mouseX > 600 && mouseY < 300){
    text("X: " + mouseX + "  Y: " + mouseY, mouseX - 100, mouseY + 20);
  }
  else {
    text("X: " + mouseX + "  Y: " + mouseY, mouseX - 100, mouseY - 30);
  }
}

void collectSun(){
  for (int idx = 0; idx < ListOfSun.size(); idx ++){
    // if the distance is low enough, you can grab the sun. this means you can hover over and collect it.
    if (dist(mouseX, mouseY, ListOfSun.get(idx).x, ListOfSun.get(idx).y) < 15){
      thingsToDisplay.remove(ListOfSun.get(idx));
      thingsToUpdate.remove(ListOfSun.get(idx));
      ListOfSun.remove(idx);
      sun += 25;
    }
  }
}

void gameOver(){
 if (gameOver == true){
  // if any zombies make it to the end, display the game over screen
  PImage end = loadImage("images/gameover.jpg");
  end.resize(1334, 750);
  ListOfZombies.clear();
  ListOfPlant.clear();
  ListOfSun.clear();
  
  thingsToUpdate.clear();
  thingsToDisplay.clear();
  delay(100);
  background(board);
  delay(100);
  board = end;
 }
}

Coordinate[][] board(){
  Coordinate[][] output = new Coordinate[5][9];
  fill(0, 0, 0);
  int x = 420;
  int y = 150;
  // create a range of values that correspond to each tile on the board. this makes it much easier to place plants, as you can treat the board as an array of 5x9
  // instead of a lot of pixels.
  for (int idx = 0; idx < 5; idx ++){
    for (int idx2 = 0; idx2 < 9; idx2 ++){
      output[idx][idx2] = new Coordinate(x,y);
      //ellipse(x, y, 20, 20);
      x += 100;
      ellipse(output[idx][idx2].getX(), output[idx][idx2].getY(), 20, 20);
    }
    y += 130;
    x = 420;
  }
  return output;
}
