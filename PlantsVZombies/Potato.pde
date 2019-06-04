class Potato extends Plant implements Updateable{
  PImage image1, image2;
  int timer;
  Potato(int r, int c){
    super(r, c, "potato.png", "potato", 25);
    image1 = loadImage("images/mine1.png");
    image = image1;
    image2 = loadImage("images/mine2.png");
  }
  
  void update(){
    if (timer >= 90) image = image2;
    else timer++;
    
    exploding();
  }
  
  void exploding(){
    for (int idx = 0; idx < ListOfZombies.size(); idx ++){
      Zombies z = ListOfZombies.get(idx);
      if (timer >= 90 && abs(dist(this.x, this.y, z.x, z.y)) < 60) {this.health = 0; z.health = 0; z.cherried = true;}
    }
  }
  void display(){
   image(image, x, y);
  }
}
