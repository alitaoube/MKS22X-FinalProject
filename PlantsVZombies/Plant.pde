abstract class Plant extends LivingThing{
  int cost;
  
  Plant(int r, int c, String type, int price){
    super(r, c, type);
    cost = price;
  }
  
  void kill(){
    thingsToDisplay.remove(this);
    ListOfPlant.remove(this);
    backyard.plantLanes.get(row).remove(this);
    thingsToUpdate.remove(this);
    backyard.occupied[row][col] = false;
  }
  
 abstract void update();
}
