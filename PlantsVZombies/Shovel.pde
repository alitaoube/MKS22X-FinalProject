class Shovel implements Updateable, Displayable{
 PImage image;
 boolean selected;
 int x, y;
 Shovel(){
   thingsToDisplay.add(this);
   thingsToUpdate.add(this);
   image = loadImage("images/shovel.png");
   image.resize(60, 60);
   x = 350 + image.width / 2;
   y = image.height / 2;
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
 
 void update(){
   
 }
}

  //LivingThing(int r, int c, String picture, String Type){
