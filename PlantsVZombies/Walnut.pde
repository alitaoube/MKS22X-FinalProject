//walnuts are plants that you can use as barriers if there are too many zombies to fight at once. 
//They have very high health so they take a long time to kill.
class Walnut extends Plant implements Updateable{
 PImage cracked1;
 PImage cracked2;
 
 Walnut(int r,int c, String type, int price){
   super(r, c, type, price);
   health = 1000;
    for (int x = 0; x < spriteNames.length; x++){
     System.out.println(type);
     if (spriteNames[x].contains("walnut")) localSprites.add(sprites.get(x));
    }
    for (int x = 0; x < localSprites.size(); x++){
     localSprites.get(x).resize(80, 80); 
    }
    //loads the images to display when the walnut is cracked from being eaten by zombies.
    cracked1 = loadImage("images/cracked1.png");
    cracked1.resize(80, 80);
    cracked2 = loadImage("images/cracked2.png");
    cracked2.resize(80, 80);
 }
 
 //simnilar to other plant update methods. 
 //since walnuts don't attack all it does is kill the walnut if the health is too low.
 void update(){   

  if (health <= 0){

    backyard.occupied[this.row][this.col] = false;      
    ListOfPlant.remove(this);
    thingsToDisplay.remove(this);
    backyard.plantLanes.get(this.row).remove(this);
    thingsToUpdate.remove(this);
    removedFromList = true;

    kill();

  }
 }
  //displays different images based on how cracked the walnut is
  void display(){
    if (health <= 334){
      imageMode(CENTER);
      image(cracked2, x, y); 
    }
    else if (health <= 667){
      imageMode(CENTER);
      image(cracked1, x, y); 
    }
    else{
      if (spriteFrame + 1 == localSprites.size()) spriteFrame = 0;
      else spriteFrame++;
      if (localSprites.size() > 0){
        image = localSprites.get(spriteFrame);
        //delay(15);
      }
      imageMode(CENTER);
      image(image, x, y); 
    }
  }
}
