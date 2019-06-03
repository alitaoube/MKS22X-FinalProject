class Walnut extends Plant implements Updateable{
 Walnut(int r,int c, String type, int price){
   super(r, c, "images/walnut.png", type, price);
   health = 1000;
    for (int x = 0; x < spriteNames.length; x++){
     System.out.println(type);
     if (spriteNames[x].contains("walnut")) localSprites.add(sprites.get(x));
    }
    for (int x = 0; x < localSprites.size(); x++){
     localSprites.get(x).resize(80, 80); 
    }
 }
 
 void update(){
  if (health <= 0){
    backyard.occupied[this.row][this.col] = false;      
    ListOfPlant.remove(this);
    thingsToDisplay.remove(this);
    backyard.plantLanes.get(this.row).remove(this);
  }
 }
 
 //void display(){
 // if (health  
 //}
}
