//this class represents the pea that the normal peashooter shoots.
class Pea implements Displayable, Moveable, Updateable{
  float x, y;
  int row;
  PImage image;
  
  Pea(float xcor, float ycor, int r) {
    x = xcor; y = ycor; row = r;
    image = loadImage("images/pea.png");
  }
  
  //displays the image of the pea
  void display(){
    image(image, x, y);
  }
  
  //moves pea towards zombies.
  void move(){x += 15;}
  
  //loops through list of zombies and if pea is close enough it returns true
  boolean touchingZombie(){
    for (int idx = 0; idx < backyard.zombieLanes.get(this.row).size(); idx ++){
      Zombies z = backyard.zombieLanes.get(this.row).get(idx);
      if (z.x - this.x < 10) return true;
    }
    return false;
  }
  
  //finds the closest zombie and returns it
  Zombies findZombie(){
    Zombies z = backyard.zombieLanes.get(this.row).get(0);
    float minDistance = dist(this.x, this.y, backyard.zombieLanes.get(this.row).get(0).x, backyard.zombieLanes.get(this.row).get(0).y);
    for (int idx = 0; idx < backyard.zombieLanes.get(this.row).size(); idx ++){
      Zombies tempZ = backyard.zombieLanes.get(this.row).get(idx);
      float newDistance = dist(this.x, this.y, tempZ.x, tempZ.y);
      if (newDistance < minDistance){
        minDistance = newDistance;
        z = tempZ;
      }
    }
    return z;
  }
  
  //if its touching a zombie it subtracts 10 from its health and then essentially leaves the gameplay
  void hitZombie(){
    if (this.touchingZombie()){
      Zombies z = this.findZombie();
      z.health -= 10;
      thingsToDisplay.remove(this);
      thingsToUpdate.remove(this);
      peas.remove(this);
      removedFromList = true;
     }
   }
  //update method to change move and kill zombies
  void update(){
    //display();
    this.hitZombie();
    this.move();
  }
}
