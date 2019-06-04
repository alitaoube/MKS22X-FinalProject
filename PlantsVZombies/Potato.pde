class Potato extends LivingThing{
  PImage image1, image2;
  int timer;
  Potato(int r, int c){
    super(r, c, "potato.png", "potato");
    image1 = loadImage("images/mine1.png");
    image2 = loadImage("images/potato2.png");
  }
  
  void update(){
    if (timer >= 90) image = image2;
    else image = image1;
    
    exploding();
  }
  
  void exploding(){
    for (int idx = 0; idx < ListOfZombies.size(); idx ++){
      Zombies z = ListOfZombies.get(idx);
      if (abs(dist(this.x, this.y, z.x, z.y)) < 200) {z.health = 0; z.cherried = true;}
    }
  }
}
