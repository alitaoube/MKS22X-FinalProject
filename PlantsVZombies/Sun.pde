class Sun implements Displayable, Moveable, Updateable{
  PImage image;
  float x, y;
  float finalY;
  boolean move;
  
  Sun(float xcor, float ycor, boolean shouldMove){
    x = xcor;
    y = ycor;
    move = shouldMove;
    Random r = new Random();
    finalY = r.nextInt(720-130) + 130;
    image = loadImage("images/sun.png");
    image.resize(70, 70);
  }
  
  void display(){
    noTint();
    image(image, x, y);
  }
  //void update(){
   // if (y < finalY) move();
  //}
  void move(){
    y += 2;
  }
//<<<<<<< HEAD
//=======
  void update(){display(); if (y < finalY && move) move();}
//  void move(){y += 2;}
//>>>>>>> genZombies
  
}
