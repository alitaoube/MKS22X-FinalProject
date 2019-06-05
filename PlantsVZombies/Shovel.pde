//shovel class that is used to remove plants.
class Shovel extends LivingThing implements Updateable, Displayable{
 PImage image;
 boolean selected;
 int x, y;

 Shovel(){
   super(0, 0, "shovel");
   thingsToDisplay.add(this);
   thingsToUpdate.add(this);
   image = loadImage("images/shovel.png");
   image.resize(60, 60);
   x = 350 + image.width / 2;
   y = image.height / 2;
 }
 
 //displays the shovel at the top and if it is selected also along the mouse x and y coordinates.
 void display(){
  if (this.selected){
   noTint();
   image(image, x, y);
   image(image, mouseX, mouseY);  
  }
  else{
   noTint();
   image(image, x, y);
  }
 }
 
 //updates the shovel to kill a plant if you click on it
 void update(){
   if (!selected) return;
   boolean removed = false;
   for (int i = 0; i < backyard.plantLanes.size(); i++){
    for (int z = 0; z < backyard.plantLanes.get(i).size(); z++){
     Plant p = backyard.plantLanes.get(i).get(z);
     if (this.selected && (abs(dist(mouseX, mouseY, p.x, p.y)) < 60) && mousePressed){
       p.kill();
       this.selected = false;
       removed = true;
     }
    }
   }
   //deselects the shovel if you click somewhere where there isn't a plant.
   if (backyard.mouseOn() && mousePressed) selected = false;
 }
}

  //LivingThing(int r, int c, String picture, String Type){
