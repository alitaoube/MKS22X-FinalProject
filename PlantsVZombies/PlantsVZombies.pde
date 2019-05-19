void setup(){
  size(1334, 750);
  PImage board = loadImage("board.jpg");
  board.resize(1334, 750);
  background(board);
  Peashooter p = new Peashooter(1,1, 380, 140, "Peashooter.png", "normal", 100);
  p.display();
  
  GardenZombie g = new GardenZombie(1, 10, 300, 300, "zombie.png", "normal", 100, 100);
  g.display();
  Board b = new Board();
  Coordinate[][] backyard = b.board();
}
