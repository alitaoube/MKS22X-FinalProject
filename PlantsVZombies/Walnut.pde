class Walnut extends Plant implements Updateable{
 Walnut(int r,int c, String type, int price){
   super(r, c, "images/walnut.png", type, price);
   health = 1000;
   image.resize(200, 150);
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
