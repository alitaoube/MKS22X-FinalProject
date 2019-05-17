abstract class Plant extends LivingThing{
  int cost;
  
  Plant(int r, int c, int xcor, int ycor, String picture, int cost){
    super(r, c, xcor, ycor, picture);
    cost = cost;
  }
 
}