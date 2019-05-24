class Pea implements Displayable, Moveable{
  
  float x, y;
  int row;
  
  Pea(float xcor, float ycor, int r) {x = xcor; y = ycor; row = r;}
  
  void display(){
    fill(0, 255, 0);
    ellipse(x, y, 22, 22);
  }
  
  void move(){x += 15;}
  
  void hitZombie(){
    for (Zombie z: backyard.get(
    
}