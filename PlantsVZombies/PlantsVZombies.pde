//plants.jpg: 69x338
//sun.jpg: 198x64
ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
int sun;

void setup(){
  sun = 0;
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  
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
  for (Displayable thing: thingsToDisplay){
    thing.display(); 
  }
 
  for (Moveable one: thingsToMove){
    one.move();
  }
  board();
}

void displaySun(){
  PImage Sun = loadImage("images/sun.jpg");
  image(Sun, 150, 7);
  fill(252, 237, 178);
  rect(210, 11, 130, 50);
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
