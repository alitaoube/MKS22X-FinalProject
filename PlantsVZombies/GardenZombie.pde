class GardenZombie extends Zombies {  

  GardenZombie(int r, int c) {
    super(r, c, "images/zombie.png", "garden", 100, 50);    
    for (int x = 0; x < localSprites.size(); x++){
      // no special properties for garden zombie, the most important part is that it serves as a template for cone and bucket zombies
     localSprites.get(x).resize(175, 175); 
    }
    
  }
}
