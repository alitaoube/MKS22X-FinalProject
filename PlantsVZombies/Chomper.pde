class Chomper extends Plant{
 ArrayList<PImage> eatingSprites = new ArrayList<PImage>();
 ArrayList<PImage> save = new ArrayList<PImage>();
 PImage ate;
 boolean eaten;
 int timer;
 
 Chomper(int r, int c){
  super(r, c, "chomper.png", "chomper", 175);
  for (int x = 0; x < spriteNames.length; x++){
   if (spriteNames[x].contains("chomperEat")){
    eatingSprites.add(loadImage("images/" + spriteNames[x] + ".png")); 
   }
   save = localSprites;
   ate = loadImage("images/cEat14");
  }
 }
 
 void update(){
   Zombies z = backyard.zombieLanes.get(this.row).get(0);
   
   if (eaten == false && z.isTouching(this)){
     z.kill();
     localSprites = eatingSprites;
   }
   if (eaten == false){
     super.display();
   }
   else{
     if (timer > 15) image = ate;
     else timer++;
   }
   if (timer > 90){
    timer = 0;
    localSprites = save;
   }
 }
}
  
