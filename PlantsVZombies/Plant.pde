abstract class Plant extends LivingThing{
  int cost;
  
  Plant(int r, int c, int xcor, int ycor, String picture, String type, int price){
    super(r, c, xcor, ycor, picture, type);
    cost = price;
  }
  
  boolean isTouching(Zombies other){
   return (dist(this.x, this.y, other.x, other.y) <= 10);
 }
 
}
