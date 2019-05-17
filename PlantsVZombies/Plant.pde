abstract class Plant extends LivingThing{
  int cost;
  
  Plant(int r, int c, int xcor, int ycor, String picture, String type, int price){
    super(r, c, xcor, ycor, picture, type);
    cost = price;
  }
 
}
