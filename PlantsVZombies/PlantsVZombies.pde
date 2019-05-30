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
int sun, sunRate;
int sunFrame;
Random r;
PImage board;
boolean selected;
String selectedPlant;
Board backyard;

void setup(){
  frameRate(60);
  sunFrame = 0;
  sun = 100;
  sunRate = 1;
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  suns = new ArrayList<Sun>();
  peashooters = new ArrayList<Peashooter>();
  peas = new ArrayList<Pea>();
  ListOfZombies = new ArrayList<Zombies>();
  ListOfPlant = new ArrayList<Plant>();
  ListOfSun = new ArrayList<Sun>();
  sunflowers = new ArrayList<Sunflower>();
  r = new Random();
  size(1334, 750);
  board = loadImage("images/board.jpg");
  backyard = new Board();
  
  Peashooter p = backyard.makePea(0, 0);//new Peashooter(0, 1, "images/Peashooter.png", "normal", 100);
  thingsToDisplay.add(p);
  ListOfPlant.add(p);
  GardenZombie g = backyard.makeGardenZombie(0, 8);
  thingsToDisplay.add(g);
  thingsToMove.add(g);
  ListOfZombies.add(g);
  
  ConeZombie z = backyard.makeConeZombie(0, 8);
  thingsToDisplay.add(z);
  thingsToMove.add(z);
  ListOfZombies.add(z);
}

void draw(){
  //PImage board = loadImage("images/board.jpg");
  //board.resize(1334, 750);
  background(board);
  displaySun();
  displayPlantsBar();
  displayMouse();
  collectSun();
  makeSun();
  selectPlant();
  placePlant();
  //peasShoot();
  
  //String s = p.image.width + "";
  //text(p.image.width + ", 400, 400);
  
  for (int x = 0; x < ListOfPlant.size(); x++){
   ListOfPlant.get(x).update();
  }
  
   for (int x = 0; x < ListOfZombies.size(); x++){
    Zombies zomb = ListOfZombies.get(x);
    if (zomb.health <= 0){
      ListOfZombies.remove(zomb);
      thingsToDisplay.remove(zomb);
    }
  }
  
  for (Displayable thing: thingsToDisplay){
    thing.display(); 
  }
  
//<<<<<<< HEAD
  for (Sun sun: ListOfSun){
    sun.move();
  }
  
  for (Peashooter p: peashooters){
  p.update();
}
//<<<<<<< HEAD
//=======
  
 
//>>>>>>> plant2
  //for (Zombies zombie: ListOfZombies){
//=======
//  for (int y = 0; y < ListOfZombies.size(); y++){
//    Zombies zombie = ListOfZombies.get(y);
////>>>>>>> ca5571b0635bf332d7ba1485e6dbe4617bbb8023
//    for (int x = 0; x < ListOfPlant.size(); x++){
//     Plant plant = ListOfPlant.get(x);
//     float i = dist(zombie.x, zombie.y, plant.x, plant.y);
      
//      if (i > 60){
//        zombie.move();
//      }
//      else{
//        zombie.attack(plant);
//      }
//    }
//  }
//  //board();
//}

  for (int x = 0; x < peas.size(); x++){
    peas.get(x).update();
  }
  
  for (int y = 0; y < ListOfZombies.size(); y++){
    Zombies zombie = ListOfZombies.get(y);
//>>>>>>> ca5571b0635bf332d7ba1485e6dbe4617bbb8023
    for (int x = 0; x < ListOfPlant.size(); x++){
     Plant plant = ListOfPlant.get(x);
     if (plant.row == zombie.row){
       zombie.update(plant);
     }
    }
  }
  //board();
}

void sunflowerMakeSun(){
  for (Sunflower s: sunflowers){
    if (s.makeSun()){
      backyard.makeSun(s.row, s.col);
    }
  }
}

//10, 10  135, 675
void selectPlant(){
  if (mousePressed && mouseX > 10 && mouseX < 135 && mouseY < 675){
    selected = true;
    if (mouseY > 610 && mouseY < 680) {selectedPlant = "flytrap"; return;}
    if (mouseY > 510 && mouseY < 580) {selectedPlant = "potato"; return;}
    if (mouseY > 410 && mouseY < 480) {selectedPlant = "cherry"; return;}
    if (mouseY > 310 && mouseY < 380) {selectedPlant = "walnut"; return;}
    if (mouseY > 210 && mouseY < 280) {selectedPlant = "snowpea"; return;}
    if (mouseY > 110 && mouseY < 180 && sun >= 100) {selectedPlant = "peashooter"; return;}
    if (mouseY > 10 && mouseY < 80 && sun >= 50) {selectedPlant = "sunflower"; return;}
    else selected = false;
    //if (mouseY > 110 && mouseY < 185 && sun >= 100){
    //  selected = true;
    //  selectedPlant = "Peashooter";
    //}
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
    selected = false;
  }
  else if (selectedPlant.equals("sunflower") && !backyard.occupied(r, c)){
    backyard.makeSunflower(r, c);
    selected = false;
  }
}

void displaySun(){
  //PFont font = createFont("pvz.ttf", 32);
  PImage Sun = loadImage("images/sun.jpg");    
  image(Sun, 150, 7);
  fill(252, 237, 178);
  rect(210, 11, 130, 50);
  //textFont(font);
  fill(0, 0, 0);
  text(sun + "", 240, 48);
}

void displayPlantsBar(){
  PImage Plants = loadImage("images/plants.jpg");
  Plants.resize(138, 676);
  image(Plants, 3, 7);
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

void makeSun(){
  if (sunFrame > 60 && ListOfSun.size() < 10){
    Sun s = new Sun(r.nextInt(1300-380-30) + 410, r.nextInt(720-130) + 130);//r.nextInt(720-130) + 130);
    thingsToDisplay.add(s);
    suns.add(s);
    thingsToMove.add(s);
    sunFrame = 0;
    ListOfSun.add(s);
  }
  sunFrame++;
}

void collectSun(){
  for (int idx = 0; idx < suns.size(); idx ++){
    if (dist(mouseX, mouseY, suns.get(idx).x, suns.get(idx).y) < 15){
      thingsToDisplay.remove(suns.get(idx));
      suns.remove(idx);
      sun += 25;
      ListOfSun.remove(idx);
    }
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
