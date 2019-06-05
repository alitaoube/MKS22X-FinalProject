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
    cracked1 = loadImage("images/cracked1.png");
    cracked1.resize(80, 80);
    cracked2 = loadImage("images/cracked2.png");
    cracked2.resize(80, 80);
 }
 
//<<<<<<< HEAD
 void update(){   
//=======
 //void update(){
 // display();
 //>>>>>>> genZombies
  if (health <= 0){
//<<<<<<< HEAD
    backyard.occupied[this.row][this.col] = false;      
    ListOfPlant.remove(this);
    thingsToDisplay.remove(this);
    backyard.plantLanes.get(this.row).remove(this);
    thingsToUpdate.remove(this);
    removedFromList = true;
//=======
    kill();
//>>>>>>> 857e4c3a090f86aa16baff26d6700853a84517f1
  }
 }
 
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
