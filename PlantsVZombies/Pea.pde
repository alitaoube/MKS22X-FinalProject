class Pea implements Displayable, Moveable, Updateable{
 //testing branch 
  float x, y;
  int row;
  PImage image;
  
  Pea(float xcor, float ycor, int r) {
    x = xcor; y = ycor; row = r;
    
    //if (type == "peashooter"){
      //image = loadImage("gpea");
    //}
    //else{
      image = loadImage("images/pea.png");
    //}
  }
  
  void display(){
    image(image, x, y);
  }
  
  void move(){x += 15;}
  
  boolean touchingZombie(){
    for (int idx = 0; idx < backyard.zombieLanes.get(this.row).size(); idx ++){
      Zombies z = backyard.zombieLanes.get(this.row).get(idx);
      if (z.x - this.x < 10) return true;
    }
    return false;
  }
  
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
  
//<<<<<<< HEAD
  void hitZombie(){
    if (this.touchingZombie()){
      Zombies z = this.findZombie();
      z.health -= 20;
      thingsToDisplay.remove(this);
      thingsToUpdate.remove(this);
      peas.remove(this);
      removedFromList = true;
     }
   }

  void update(){
    //display();
    this.hitZombie();
    this.move();
  }
}
