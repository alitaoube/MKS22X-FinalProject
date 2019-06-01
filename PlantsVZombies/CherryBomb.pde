class CherryBomb extends Plant implements Updateable{
  
  //float xImgSize;
  //float yImgSize;
  boolean explode;
  
  CherryBomb(int r, int c){
    super(r, c, "images/cherrybomb.jpg", "CherryBomb", 150);
    explode = false;
  }
  
  void display(){
    if (!explode) super.display();
    else{
      tint(0);
      image(image, this.x, this.y);
    }
  }
    
  
  void update(){
    display();
    getBig();
    if (image.width > 150 && image.height > 150) explode = true;
    //if (!explode) display();
    //else {tint(255); display(); exploding();}
  }
  
  //void getBig(){modImage((int)(1.2*image.width), (int)(1.01*image.height));}
  void getBig(){
    //print("width: " + image.width + "height: " + image.height);
    modImage(1 + image.width, 1 + image.height);
    x -= .5;
    y-= .5;
    //x = backyard.board[r][c].getX() - (image.width)/2;
    //y = backyard.board[r][c].getY() - (image.width)/2;
  }
  
  void exploding(){
    for (int idx = 0; idx < ListOfZombies.size(); idx ++){
      Zombies z = ListOfZombies.get(idx);
      float myX = backyard.board[this.row][this.col].getX();
      float myY = backyard.board[this.row][this.col].getY();
      if (abs(dist(this.x, this.y, z.x, z.y)) < 200) z.health = 0;
    }
  }
  
  
  
}
