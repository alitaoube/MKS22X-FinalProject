class GardenZombie extends Zombies {  

  GardenZombie(int r, int c) {
    super(r, c, "images/zombie.png", "garden", 100, 50);
    modImage(70, 120);
    y -= 20;
  }
}
