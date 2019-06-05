class Coordinate{
  // match up X Y pairs to the grid of array, so that you can use row and columns instead of a range of x and y values.
  
  float x, y;
  float[] orderedPair;
  
  Coordinate(float xcor, float ycor){
    x = xcor; y = ycor;
    orderedPair = new float[]{x, y};
  }
  
  float getX() {return x;}
  float getY() {return y;}
  float[] getOp() {return orderedPair;}
}
