class Chomper extends Plant implements Updateable{
 ArrayList<PImage> eatingSprites = new ArrayList<PImage>();
 ArrayList<PImage> save = new ArrayList<PImage>();
 PImage ate;
 boolean eaten;
 int timer;
 
 Chomper(int r, int c){
  super(r, c, "chomper", 175);
  for (int x = 0; x < spriteNames.length; x++){
    // this adds the sprites for the plant images in the motion of eating
   if (spriteNames[x].contains("cEat")){
    eatingSprites.add(loadImage("images/" + spriteNames[x] + ".png")); 
   }
   // these are the sprites for when its waiting for its meal
   if (spriteNames[x].contains("chomper")){
    localSprites.add(loadImage("images/" + spriteNames[x] + ".png"));
   }
   // this is the buffer period; when it's waiting to eat something
   save = localSprites;
  }
  health = 100;
  ate = loadImage("images/cEat14.png");
  image = localSprites.get(0);
 }
 
 void update(){
   if (health <= 0){
    this.kill();
   }
   for (int idx = 0; idx < backyard.zombieLanes.get(this.row).size(); idx ++){
    Zombies z = backyard.zombieLanes.get(this.row).get(idx);    
      if (eaten == false && this.isTouching(z)){
         eaten = true;
         // if it eats, it switches to those, and kills the zombie
         localSprites = eatingSprites;
         z.kill();
       }
     }
     // this is while it's waiting to be put of it's buffer
   if (eaten == true && timer > 5 && timer < 90){
    timer++;
   }
   // here it resets everything
   if (eaten == true && timer > 90){
     eaten = false;
     timer = 0;
     localSprites = save;
   }
 }
 
   void display(){
     // the standard alternating
    if (spriteFrame + 1 == localSprites.size()) spriteFrame = 0;
    else spriteFrame++;
    if (localSprites.size() > 0){
      image = localSprites.get(spriteFrame);
    }
    // if it has eaten anything, it switches to the buffer image
    if (eaten == true){
     image = ate; 
    }
    imageMode(CENTER);
    image(image, x, y);
  }
}
  
