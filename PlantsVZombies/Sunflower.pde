class Sunflower extends Plant{
  
  int genSun;
  
  Sunflower(int r, int c){
    super(r, c, "images/sunflower.jpg", "sunflower", 50);
    genSun = 0;
  }
  
  boolean makeSun(){
    if (genSun < 120) {genSun ++; return false;}
    else {genSun = 0; return true;}
  }
}
