class Pea implements Displayable, Moveable{
 //testing branch 
  float x, y;
  int row;
  
  Pea(float xcor, float ycor, int r) {x = xcor; y = ycor; row = r;}
  
  void display(){
    fill(0, 255, 0);
    ellipse(x, y, 22, 22);
  }
  
  void move(){x += 15;}
  
  boolean touchingZombie(){
    for (int idx = 0; idx < backyard.zombieLanes.get(this.row).size(); idx ++){
      Zombies z = backyard.zombieLanes.get(this.row).get(idx);
      if (z.x - this.x < -20) return true;
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
      peas.remove(this);
    }
   }

  void update(){
    this.hitZombie();
    this.move();
  //
//=======
//  void update(){
//    if (this.touchingZombie()){
//    Zombies z = this.findZombie();
//    z.health -= 100;
//    thingsToDisplay.remove(this);
//    peas.remove(this);
//    }
//>>>>>>> 9bc860c4237a56faad72951bcbb783f4c226e814
  }
}
