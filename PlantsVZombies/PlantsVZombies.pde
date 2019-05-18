void setup(){
  size(1334, 750);
  PImage board = loadImage("board.png");
  board.resize(1334, 750);
  background(board);
  Peashooter p = new Peashooter(1,1, 380, 140, "Peashooter.png", "normal", 100);
  p.display();
  Board b = new Board();
  Coordinate[][] backyard = b.board();
}
