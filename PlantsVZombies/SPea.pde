class SPea extends Pea{
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
}
