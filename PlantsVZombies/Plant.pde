abstract class Plant extends LivingThing{
  int cost;
  
  Plant(int r, int c, String picture, String type, int price){
    super(r, c, picture, type);
    cost = price;
  }
  
  boolean isTouching(LivingThing other){
   return (row == other.row && col == other.col);
 }
 
}
