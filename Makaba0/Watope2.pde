class Watope2{
  //vars (square)
  int x;
  int y;
  int w;
  int speed;
  color c;
  
  //hitbox 
   int left;
  int right;
  int top;
  int bottom;
  
  int healthW;
  int healthX;
  int healthY;
  int healthH;
  
  boolean shouldRemove;
  
   //Animation
  Animation wani2;
  PImage[] W2 = new PImage[8];
  
  Watope2(){
    x = int(random(width/4, 3*width/4));
    y = int(random(0, height));
    w = 55;
    speed = int(random(0.5,3));
    c = #79322C;
    
    //hitbox
   left = x-w/2;
   right = x+w/2;
   top = y - w/2;
   bottom = y + w/2;
   
   //health bar
   healthX = x;
   healthY = y;
   healthW = 60;
   healthH = 10;
   
   shouldRemove = false;
   
   
   //ani
   for(int i=0; i<W2.length; i++){
     W2[i] = loadImage("W2" + i + ".png");
   }
   
   wani2 = new Animation(W2, .05, 3);
  }
  
  //functions
  void render(){
    fill(c);
    wani2.display(x,y);
  }
  
  void move(Player aPlayer){
    //watope hitbox
    left = x-w/2;
   right = x+w/2;
   top = y - w/2;
   bottom = y + w/2;
    
    if(aPlayer.x > x){
      x += speed;
      healthX += speed;
    }
     if(aPlayer.x < x){
      x -= speed;
      healthX -= speed;
    }
     if(aPlayer.y > y){
      y += speed;
      healthY += speed;
    }
     if(aPlayer.y < x){
      y -= speed;
      healthY -= speed;
    }
    
    wani2.isAnimating = true;
   health();
   
   if (abomination.isPlaying()==false) {
    abomination.play();
  }
  }
  
  void collide(Player aPlayer){
    if(aPlayer.top < bottom &&
       aPlayer.bottom >= top &&
       aPlayer.right >= left &&
       aPlayer.left <= right){
         println("ow");
         aPlayer.healthW -= 1;
       }
         
  }
  
  void health(){
    noFill();
    rect(healthX,healthY,healthW,healthH);
  }
  
}
