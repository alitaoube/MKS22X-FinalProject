abstract class Plant extends LivingThing{
  int cost;
  
  Plant(int r, int c, String picture, String type, int price){
    super(r, c, picture, type);
    cost = price;
  }
  
  boolean isTouching(LivingThing other){
   return ((Math.sqrt(Math.pow(this.x - other.x, 2) + Math.pow(this.y - other.y, 2))) <= 50);
 }
 
}
