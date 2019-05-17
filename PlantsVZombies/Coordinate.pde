class Coordinate{
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
