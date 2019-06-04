class Walnut extends Plant implements Updateable{
 PImage cracked1;
 PImage cracked2;
 
 Walnut(int r,int c, String type, int price){
   super(r, c, "images/walnut.png", type, price);
   health = 1000;
    for (int x = 0; x < spriteNames.length; x++){
     System.out.println(type);
     if (spriteNames[x].contains("walnut")) localSprites.add(sprites.get(x));
    }
    for (int x = 0; x < localSprites.size(); x++){
     localSprites.get(x).resize(80, 80); 
    }
    cracked1 = loadImage("images/cracked1.png");
    cracked1.resize(80, 80);
    cracked2 = loadImage("images/cracked2.png");
    cracked2.resize(80, 80);
 }
 
 void update(){   
  if (health <= 0){
    kill();
  }
 }
 
  void display(){
    if (health <= 334){
      imageMode(CENTER);
      image(cracked2, x, y); 
    }
    else if (health <= 667){
      imageMode(CENTER);
      image(cracked1, x, y); 
    }
    else{
      if (frameCount + 1 == localSprites.size()) frameCount = 0;
      else frameCount++;
      if (localSprites.size() > 0){
        image = localSprites.get(frameCount);
        //delay(15);
      }
      imageMode(CENTER);
      image(image, x, y); 
    }
  }
}
