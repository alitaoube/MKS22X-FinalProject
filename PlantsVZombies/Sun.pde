class Sun implements Displayable{
 
  float x, y; 
  
  Sun(float xcor, float ycor){
    x = xcor;
    y = ycor;
  }
  
  void display(){
    fill(255, 255, 50);
    ellipse(x, y, 30, 30);
  }
}
