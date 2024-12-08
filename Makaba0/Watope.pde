class Watope{
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
  boolean shouldRemove;
  
  //Animation
  Animation wani;
  PImage[] W1 = new PImage[5];
  
  
  
  Watope(){
    x = int(random(width/4, 3*width/4));
    y = int(random(0, height));
    w = 35;
    speed = int(random(0.5,3));
    c = #70A587;
    
    //hitbox
   left = x-w;
   right = x+w;
   top = y - w;
   bottom = y + w;
   
   shouldRemove = false;
   
   //ani
   for(int i=0; i<W1.length; i++){
     W1[i] = loadImage("W1" + i + ".png");
   }
   
   wani = new Animation(W1, .05, 3);
   
   
  }
  
  //functions
  void render(){
    fill(c);
    wani.display(x,y);
  }
  
  void move(Player aPlayer){
    //watope hitbox
    left = x-w;
   right = x+w;
   top = y - w;
   bottom = y + w;
    
    if(aPlayer.x > x){
      x += speed;
    }
     if(aPlayer.x < x){
      x -= speed;
    }
     if(aPlayer.y > y){
      y += speed;
    }
     if(aPlayer.y < x){
      y -= speed;
    }
    
    wani.isAnimating = true;
    
    if (slime.isPlaying()==false) {
    slime.play();
  }
  }
  
  void collide(Player aPlayer){
    if(aPlayer.top < bottom &&
       aPlayer.bottom >= top &&
       aPlayer.right >= left &&
       aPlayer.left <= right){
         println("ow");
         aPlayer.healthW -= .5;
       }
         
  }
  
  
}
