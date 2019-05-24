class Pea implements Displayable, Moveable{
  
  float x, y;
  
  Pea(float xcor, float ycor) {x = xcor; y = ycor;}
  
  void display(){
    fill(0, 255, 0);
    ellipse(x, y, 22, 22);
  }
  
  void move(){x += 15;}
    
}
