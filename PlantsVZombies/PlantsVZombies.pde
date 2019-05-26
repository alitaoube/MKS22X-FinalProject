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
  sun = 0;
  sunRate = 1;
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  suns = new ArrayList<Sun>();
  peashooters = new ArrayList<Peashooter>();
  peas = new ArrayList<Pea>();
  ListOfZombies = new ArrayList<Zombies>();
  ListOfPlant = new ArrayList<Plant>();
  ListOfSun = new ArrayList<Sun>();
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
  peasShoot();
  movePeas();
  hitZombie();
  //String s = p.image.width + "";
  //text(p.image.width + ", 400, 400);
  
  for (int x = 0; x < ListOfPlant.size(); x++){
    Plant plant = ListOfPlant.get(x);
    System.out.println(plant.health);
    if (plant.health <= 0){
      ListOfPlant.remove(plant);
      thingsToDisplay.remove(plant);
    }
  }
  
  for (Displayable thing: thingsToDisplay){
    thing.display(); 
  }
  
  for (Sun sun: ListOfSun){
    sun.move();
  }
  
  for (Zombies zombie: ListOfZombies){
    for (int x = 0; x < ListOfPlant.size(); x++){
      Plant plant = ListOfPlant.get(x);
      float i = dist(zombie.x, zombie.y, plant.x, plant.y);

      if (i > 60){
        zombie.move();
      }
      else{
        zombie.attack(plant);
      }
    }

    //for (Plant plant: ListOfPlant){
    //  float x = dist(zombie.x, zombie.y, plant.x, plant.y);
    //  if (x > 60){
    //    zombie.move();
    //  }
    //}
  }
  board();
}

void hitZombie(){
  for (int idx = 0; idx < peas.size(); idx ++){
    if (peas.get(idx).touchingZombie()){
      Zombies z = peas.get(idx).findZombie();
      z.health -= 1;
      thingsToDisplay.remove(peas.get(idx));
      peas.remove(idx);
    }
  }
}

void movePeas(){
  for (Pea p: peas){
    p.move();
  }
}

void peasShoot(){
  for (Peashooter p: peashooters){
    p.makePea();
  }
}

void selectPlant(){
  if (mousePressed && mouseX > 10 && mouseX < 135){
    if (mouseY > 110 && mouseY < 185 && sun >= 100){
      selected = true;
      selectedPlant = "Peashooter";
    }
  }
}

void placePlant(){
  int r = 0; int c = 0;
  float minDistance = dist(mouseX, mouseY, backyard.board[0][0].x, backyard.board[0][0].y);
  if (selected && mousePressed && backyard.mouseOn()){
    for (int idx = 0; idx < backyard.board.length; idx ++){
      for (int idx2 = 0; idx2 < backyard.board[0].length; idx2 ++){
        float dis = dist(mouseX, mouseY, backyard.board[idx][idx2].x, backyard.board[idx][idx2].y);
        if (dis < minDistance){
          minDistance = dis;
          r = idx; c = idx2;
        }
      }
    }
    if (selectedPlant.equals("Peashooter") && !backyard.occupied(r, c)){
      Peashooter p2 = backyard.makePea(r, c);
      thingsToDisplay.add(p2);
      sun -= 100;
      selected = false;
      selectedPlant = null;
    }
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
  if (sunFrame > 60){
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
