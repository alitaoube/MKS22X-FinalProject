class Sun implements Displayable, Moveable, Updateable{
 
  float x, y;
  float finalY;
  
  Sun(float xcor, float ycor){
    x = xcor;
    y = ycor;
    Random r = new Random();
    finalY = r.nextInt(720-130) + 130;
  }
  
  void display(){
    fill(255, 255, 50);
    ellipse(x, y, 30, 30);
  }
  void update(){if (y < finalY) move();}
  void move(){y += 2;}
  
}