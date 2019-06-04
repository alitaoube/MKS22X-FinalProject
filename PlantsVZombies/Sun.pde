class Sun implements Displayable, Moveable, Updateable{
 
  float x, y;
  float finalY;
  boolean move;
  
  Sun(float xcor, float ycor, boolean shouldMove){
    x = xcor;
    y = ycor;
    move = shouldMove;
    Random r = new Random();
    finalY = r.nextInt(720-130) + 130;
  }
  
  void display(){
    fill(255, 255, 50);
    ellipse(x, y, 30, 30);
  }
  void update(){display(); if (y < finalY && move) move();}
  void move(){y += 2;}
  
}
