class Sun implements Displayable, Moveable{
 
  float x, y;
  float finalY;
  
  Sun(float xcor, float ycor){
    x = xcor;
    y = ycor;
    finalY = 400;
  }
  
  void display(){
    fill(255, 255, 50);
    ellipse(x, y, 30, 30);
  }
  
  void move(){if (y < finalY) y += 15;}
  
}
