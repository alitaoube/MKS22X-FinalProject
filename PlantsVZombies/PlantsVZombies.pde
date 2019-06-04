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
int sunFrame;
Random r;
PImage board;
boolean selected;
String selectedPlant;
boolean gameOver;
Board backyard;
String[] spriteNames;
ArrayList<PImage> sprites;
boolean removedFromList;

void setup(){
  frameRate(60);
  sunFrame = 0;
  sun = 10000;
  sunRate = 1;
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
  new Lawnmower();
  removedFromList = false;
  for (int x = 0; x < spriteNames.length; x++){
    sprites.add(loadImage("images/" + spriteNames[x] + ".png"));
    
  }
  
  r = new Random();
  size(1334, 750);
  board = loadImage("images/board.jpg");
  backyard = new Board();
  backyard.makeGardenZombie(0, 8);
  backyard.makeConeZombie(0, 6);
  backyard.makeBucketZombie(0, 7);
}
//<<<<<<< HEAD

  //backyard.makePea(0, 0);//new Peashooter(0, 1, "images/Peashooter.png", "normal", 100); 
//=======
  //backyard.makePea(0, 0);//new Peashooter(0, 1, "images/Peashooter.png", "normal", 100); 
  //backyard.makeGardenZombie(0, 8);
  //backyard.makeConeZombie(0, 6);
  //backyard.makeBucketZombie(0, 7);

//>>>>>>> genZombies
  

void draw(){
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
  backyard.setPlantableValues();
  //gameOver();
//<<<<<<< HEAD
  
  //for (Displayable thing: thingsToDisplay) thing.display();  
  
  for (int x = 0; x < ListOfLawnmowers.size(); x++){
    ListOfLawnmowers.get(x).display();
    ListOfLawnmowers.get(x).update();
  }
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
//=======
  //for (Displayable thing: thingsToDisplay) if (!(thing instanceof Plant)) thing.display();   
  //for (int x = 0; x < thingsToUpdate.size(); x++){
  // thingsToUpdate.get(x).update(); 
  // if (removedFromList) x --;
  // removedFromList = false;
  //}
  //for (int x = 0; x < peas.size(); x++){
  // peas.get(x).display(); 
//>>>>>>> genZombies
//  board();
}


void selectPlant(){
  if (mousePressed && mouseX > 10 && mouseX < 135 && mouseY < 675){
    selected = true;
    if (mouseY > 610 && mouseY < 680 && sun >= 150 && backyard.plantable[3] == 0) {selectedPlant = "flytrap"; return;}
    if (mouseY > 510 && mouseY < 580 && sun >= 25 && backyard.plantable[4] == 0) {selectedPlant = "potato"; return;}
    if (mouseY > 410 && mouseY < 480 && sun >= 150 && backyard.plantable[5] == 0) {selectedPlant = "cherry"; return;}
    if (mouseY > 310 && mouseY < 380 && sun >= 50 && backyard.plantable[6] == 0) {selectedPlant = "walnut"; return;}
    if (mouseY > 210 && mouseY < 280 && sun >= 175 && backyard.plantable[0] == 0) {selectedPlant = "snowpea"; return;}
    if (mouseY > 110 && mouseY < 180 && sun >= 100 && backyard.plantable[1] == 0) {selectedPlant = "peashooter"; return;}
    if (mouseY > 10 && mouseY < 80 && sun >= 50  && backyard.plantable[2] == 0) {selectedPlant = "sunflower"; return;}
    else selected = false;
  }
}

void placePlant(){
  if (!(selected && mousePressed && backyard.mouseOn())) return;
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
}

void displaySun(){
  //PFont font = createFont("pvz.ttf", 32);
  PImage Sun = loadImage("images/sun.jpg");  
  noTint();
  imageMode(CENTER);
  image(Sun, Sun.width /2 + 138 + 11, Sun.height / 2 + 7);
  fill(252, 237, 178);
  rect(210, 11, 130, 50);
  //textFont(font);
  fill(0, 0, 0);
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
    if (dist(mouseX, mouseY, ListOfSun.get(idx).x, ListOfSun.get(idx).y) < 15){
      thingsToDisplay.remove(ListOfSun.get(idx));
      thingsToUpdate.remove(ListOfSun.get(idx));
      //suns.remove(idx);
      sun += 25;
      ListOfSun.remove(idx);
    }
  }
}

void gameOver(){
 if (gameOver == true){
  PImage end = loadImage("images/gameover.jpg");
  end.resize(1334, 750);
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
