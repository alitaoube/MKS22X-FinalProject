class Snowpea extends Peashooter{
  int timer;
  Snowpea(int r, int c){
    super(r, c, "snowpea", 175);
    for (int x = 0; x < localSprites.size(); x++){
     localSprites.get(x).resize(200, 200); 
    }
  }
  
  void makePea(){
    if (peaFrame >= 30 && !backyard.zombieLanes.get(this.row).isEmpty()){
      SPea p = new SPea(this.x, this.y, this.row);
      peas.add(p);
      thingsToDisplay.add(p);
      peaFrame = 0;
    }
    peaFrame++;
  }
}
