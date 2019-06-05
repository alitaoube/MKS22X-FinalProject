//abstract class for plants
abstract class Plant extends LivingThing{
  int cost;
  
  Plant(int r, int c, String type, int price){
    super(r, c, type);
    cost = price;
  }
  
  //method useful for when you are using the shovel to remove a plant
  void kill(){
    thingsToDisplay.remove(this);
    ListOfPlant.remove(this);
    backyard.plantLanes.get(row).remove(this);
    thingsToUpdate.remove(this);
    backyard.occupied[row][col] = false;
  }
  
 //necessary because all plants need to update their status. 
 abstract void update();
}
