class Shovel extends LivingThing implements Updateable, Displayable{
 PImage image;
 boolean selected;
 int x, y;

 Shovel(){
   super(0, 0, "shovel", "shovel");
   thingsToDisplay.add(this);
   thingsToUpdate.add(this);
   image = loadImage("images/shovel.png");
   image.resize(60, 60);
   x = 350 + image.width / 2;
   y = image.height / 2;
 }
 
 void display(){
  if (this.selected){
   image(image, x, y);
   image(image, mouseX, mouseY);  
  }
  else{
   image(image, x, y);
  }
 }
 
 void update(){
   for (int i = 0; i < backyard.plantLanes.size(); i++){
    for (int z = 0; z < backyard.plantLanes.get(i).size(); z++){
     Plant p = backyard.plantLanes.get(i).get(z);
     if (this.selected == true && (abs(dist(mouseX, mouseY, p.x, p.y)) < 60)){
      p.kill();
      this.selected = false;
     }
    }
   }
 }
}

  //LivingThing(int r, int c, String picture, String Type){
