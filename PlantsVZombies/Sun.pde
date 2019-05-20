class Sun implements Displayable{
 
  float x, y; 
  
  Sun(){
    x = 4;
    y = 4;
  }
  
  void display(){
    fill(255, 255, 50);
    ellipse(x, y, 7, 7);
  }
}
