//class that stores the sun object
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
    //finalY exists so that it can float down from the sky and stop somwehere on the backyard.
    finalY = r.nextInt(720-130) + 130;
    image = loadImage("images/sun.png");
    image.resize(70, 70);
  }
  
  //displays the sun image
  void display(){
    noTint();
    image(image, x, y);
  }
  
  //slowly has the sun move down the screen to simulate falling from the sky.
  void move(){
    y += 2;
  }

  //displays the sun and then has it fall only if it hasn't reached its final destination right away.
  void update(){display(); if (y < finalY && move) move();}
  
}
