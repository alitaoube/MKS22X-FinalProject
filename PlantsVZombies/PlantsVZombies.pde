ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup(){
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  
  size(1334, 750);

  Peashooter p = new Peashooter(1,1, 380, 140, "Peashooter.png", "normal", 100);
  thingsToDisplay.add(p);
    
  GardenZombie g = new GardenZombie(1, 10, 700, 300, "zombie.png", "normal", 100, 100);
  thingsToDisplay.add(g);
  thingsToMove.add(g);
  Board b = new Board();
  Coordinate[][] backyard = b.board();
}

void draw(){
  PImage board = loadImage("board.jpg");
  board.resize(1334, 750);
  background(board);
  for (Displayable thing: thingsToDisplay){
    thing.display(); 
  }
 
  for (Moveable one: thingsToMove){
    one.move();
  }
}
