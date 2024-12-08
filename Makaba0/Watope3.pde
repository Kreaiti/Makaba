class Watope3{
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
  Animation wani3;
  PImage[] W3 = new PImage[6];
  
  Watope3(){
     x = int(random(width/4, 3*width/4));
    y = int(random(0, height));
    w = 75;
    speed = int(random(0.5,3));
    c = #AA8B81;
    
    //hitbox
   left = x-w/2;
   right = x+w/2;
   top = y - w/2;
   bottom = y + w/2;
   
    //health bar
   healthX = x;
   healthY = y;
   healthW = 90;
   healthH = 10;
   
   shouldRemove = false;
   
    //ani
   for(int i=0; i<W3.length; i++){
     W3[i] = loadImage("W3" + i + ".png");
   }
   
   wani3 = new Animation(W3, .05, 3);
  }
  
  //functions
  void render(){
    fill(c);
    wani3.display(x,y);
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
    
    wani3.isAnimating = true;
    health();
    
     if (hulk.isPlaying()==false) {
    hulk.play();
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
