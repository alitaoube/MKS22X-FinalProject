class GardenZombie extends Zombies {  

  GardenZombie(int r, int c) {
    super(r, c, "images/zombie.png", "garden", 100, 50);    
    for (int x = 0; x < localSprites.size(); x++){
     localSprites.get(x).resize(175, 175); 
    }
    
  }
}
