ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;
ArrayList<Plant> ListOfPlants;
ArrayList<Zombies> ListOfZombies;

void setup(){
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  
  size(1334, 750);

  Peashooter p = new Peashooter(1,1, 380, 140, "images/Peashooter.png", "normal", 100);
  thingsToDisplay.add(p);
  ListOfPlants.add(p);
    
  GardenZombie g = new GardenZombie(1, 1, 380, 140, "images/zombie.png", "normal", 100, 5);
  thingsToDisplay.add(g);
  thingsToMove.add(g);
  ListOfZombies.add(g);

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
  for (Zombies one: ListOfZombies){
    for (Plant plant: ListOfPlants){
      if (!plant.isTouching(one)){
        one.move();
      }
    }
    }
  }
