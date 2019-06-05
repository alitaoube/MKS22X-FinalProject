//snow peashooter that shoots peas that numb zombies and make them slower and appear blue
class Snowpea extends Peashooter{
  int timer;
  Snowpea(int r, int c){
    super(r, c, "snowpea", 175);
    for (int x = 0; x < localSprites.size(); x++){
     localSprites.get(x).resize(200, 200); 
    }
  }
  
  //similar to make pea in superclass but makes a snowpea
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
