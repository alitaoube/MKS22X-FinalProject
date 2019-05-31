class Sun implements Displayable, Moveable{
 
  float x, y;
  float finalY;
  
  Sun(float xcor, float ycor){
    x = xcor;
    finalY = ycor;
    Random r = new Random();
    y = 0;
  }
  
  void display(){
    fill(255, 255, 50);
    ellipse(x, y, 30, 30);
  }
  void update(){if (y < finalY) move();}
  void move(){y += 2;}
  
}
