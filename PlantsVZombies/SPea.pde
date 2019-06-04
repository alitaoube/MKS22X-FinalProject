class SPea extends Pea{
  int peaFrame;

  SPea(float xcor, float ycor, int r, String type){
    super(xcor, ycor, r, type);
  }
  
  void hitZombie(){
    if (this.touchingZombie()){
      Zombies z = this.findZombie();
      z.health -= 20;
      thingsToDisplay.remove(this);
      peas.remove(this);
      z.blue = true;
      z.timer = 0;
     }
  }
   
  void update(){
    this.hitZombie();
    this.move();
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
