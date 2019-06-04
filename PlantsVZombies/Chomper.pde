class Chomper extends Plant implements Updateable{
 ArrayList<PImage> eatingSprites = new ArrayList<PImage>();
 ArrayList<PImage> save = new ArrayList<PImage>();
 PImage ate;
 boolean eaten;
 int timer;
 
 Chomper(int r, int c){
  super(r, c, "chomper.png", "chomper", 175);
  for (int x = 0; x < spriteNames.length; x++){
   if (spriteNames[x].contains("cEat")){
    eatingSprites.add(loadImage("images/" + spriteNames[x] + ".png")); 
   }
   if (spriteNames[x].contains("chomper")){
    localSprites.add(loadImage("images/" + spriteNames[x] + ".png"));
   }
   save = localSprites;
   ate = loadImage("images/cEat14.png");
  }
  image = localSprites.get(0);
  System.out.println(localSprites.size());
  System.out.println(eatingSprites.size());
 }
 
 void update(){
   for (int idx = 0; idx < ListOfZombies.size(); idx ++){
    Zombies z = ListOfZombies.get(idx);    
      if (eaten == false && this.isTouching(z)){
         eaten = true;
         localSprites = eatingSprites;
         z.kill();
       }
     }
   if (eaten == true && timer > 5 && timer < 90){
    image = ate;
   }
   else if (eaten == true && timer > 90){
     eaten = false;
     timer = 0;
     localSprites = save;
   }
   else if (eaten == true && timer < 90){
    timer++; 
   }
 }
}
  
