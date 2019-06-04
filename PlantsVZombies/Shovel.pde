class Shovel implements Updateable{
 PImage image;
 boolean selected;
 int x, y;
 Shovel(){
   x = 350 + shovel.width / 2;
   y = shovel.height / 2;
   image = loadImage("images/shovel.png");
 }
 
 void display(){
  if (selected){
   image(image, x, y);
   image(image, mouseX, mouseY);  
  }
  else{
   image(image, x, y);
  }
 }
}

  //LivingThing(int r, int c, String picture, String Type){
