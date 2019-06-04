class Sun implements Displayable, Moveable, Updateable{
  PImage image;
  float x, y;
  float finalY;
  
  Sun(float xcor, float ycor){
    x = xcor;
    y = ycor;
    Random r = new Random();
    finalY = r.nextInt(720-130) + 130;
    image = loadImage("images/sun.png");
    image.resize(70, 70);
  }
  
  void display(){
    noTint();
    image(image, x, y);
  }
  void update(){
    if (y < finalY) move();
  }
  void move(){
    y += 2;
  }
  
}
