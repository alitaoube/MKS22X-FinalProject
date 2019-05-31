abstract class Plant extends LivingThing{
  int cost;
  
  Plant(int r, int c, String picture, String type, int price){
    super(r, c, picture, type);
    cost = price;
  }
  
 abstract void update();
}
