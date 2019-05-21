//plants.jpg: 69x338
//sun.jpg: 198x64
//green starts: 380, 100. green ends: 1300, 720
import java.util.Random;
ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
ArrayList<Sun> suns;
int sun, sunRate, seconds;
boolean makeSun;
Random r;

void setup(){
  frameRate(60);
  sun = 0;
  sunRate = 1;
  makeSun = false;
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  suns = new ArrayList<Sun>();
  r = new Random();
  size(1334, 750);

  Peashooter p = new Peashooter(1,1, 380, 140, "images/Peashooter.png", "normal", 100);
  thingsToDisplay.add(p);
    
  GardenZombie g = new GardenZombie(1, 10, 700, 300, "images/zombie.png", "normal", 100, 100);
  thingsToDisplay.add(g);
  thingsToMove.add(g);
}

void draw(){
  PImage board = loadImage("images/board.jpg");
  board.resize(1334, 750);
  background(board);
  displaySun();
  displayPlantsBar();
  displayMouse();
  collectSun();
  if (frameCount % (60 * sunRate) == 0){
    Sun s = new Sun(r.nextInt(1300-380-30) + 410, r.nextInt(720-130) + 130);
    thingsToDisplay.add(s);
    suns.add(s);
  }
  for (Displayable thing: thingsToDisplay){
    thing.display(); 
  }
 
  for (Moveable one: thingsToMove){
    one.move();
  }
  board();
}

void displaySun(){
  PFont font = createFont("pvz.ttf", 32);
  PImage Sun = loadImage("images/sun.jpg");    
  image(Sun, 150, 7);
  fill(252, 237, 178);
  rect(210, 11, 130, 50);
  textFont(font);
  
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
  text("X: " + mouseX + "  Y: " + mouseY, mouseX - 100, mouseY - 20);
}

void collectSun(){
  for (int idx = 0; idx < suns.size(); idx ++){
    if (dist(mouseX, mouseY, suns.get(idx).x, suns.get(idx).y) < 15 && mousePressed){
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
