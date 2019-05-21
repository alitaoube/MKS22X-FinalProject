ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
ArrayList<Collideable> ListOfCollideables;

void setup(){
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  ListOfCollideables = new ArrayList<Collideable>();
  
  size(1334, 750);

  Peashooter p = new Peashooter(1,1, 380, 140, "images/Peashooter.png", "normal", 100);
  thingsToDisplay.add(p);
  ListOfCollideables.add(p);
    
  GardenZombie g = new GardenZombie(1, 1, 380, 140, "images/zombie.png", "normal", 100, 5);
  thingsToDisplay.add(g);
  thingsToMove.add(g);
  ListOfCollideables.add(g);

  Board b = new Board();
  Coordinate[][] backyard = b.board();
}

void draw(){
  PImage board = loadImage("images/board.jpg");
  board.resize(1334, 750);
  background(board);
  for (Displayable thing: thingsToDisplay){
    thing.display(); 
  }
  for (Moveable one: thingsToMove){
    //for (Collideable c: ListOfCollideables){
      //if (!c.isTouching(this)){
        one.move();
      //}
    }
  }
//}
