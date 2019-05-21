class Peashooter extends Plant{
  
  Peashooter(int r, int c, int xcor, int ycor, String picture, String type, int price){
    super(r, c, xcor, ycor, picture, type, price);
    modImage(75, 75);
  }

  void attack(){}
  
 boolean isTouching(Zombies other){
   return (dist(this.x, this.y, other.x, other.y) <= 10);
 }
}
