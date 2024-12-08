class Obstacle{
  //vars
  int x;
  int y;
  int w;
  int h;
  
  //hitbox vars
  int left;
  int right;
  int top;
  int bottom;
  
  
  //construct
  Obstacle(int startingX, int startingY, int startingW, int startingH){
   x = startingX;
   y = startingY;
   w = startingW;
   h = startingH;
   
   //hitbox
   left = x-w/2;
   right = x+w/2;
   top = y - h/2;
   bottom = y + h/2;
  }
  
  void render(){
    noFill();
    stroke(#8E9F6D);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
  
  void collideP(Player aPlayer){
    if(aPlayer.top < bottom &&
       aPlayer.bottom >= top &&
       aPlayer.right >= left &&
       aPlayer.left <= right){
         aPlayer.isMovingUp = false;
         aPlayer.y = y + h/2 + aPlayer.d/2;
       }
  }
  
}
