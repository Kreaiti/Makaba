class Player {
  //vars
  int x;
  int y;
  int d;
  color c;

  //hitbox for player
  int left;
  int right;
  int top;
  int bottom;

  //halberd (rect)
  int hx;
  int hy;
  int hw;
  int hh;

  //halberd hitbox
  int ht;
  int hb;
  int hl;
  int hr;
  boolean isTall = true;

  boolean isMovingLeft;
  boolean isMovingRight;
  boolean isMovingUp;
  boolean isMovingDown;

  boolean isHurt;

  int speed;

  //animations
  Animation pWalk;
  PImage[] Khija_walking = new PImage[6];
  
  Animation pSwing;
  PImage[] kSwing = new PImage [5];

  int healthX;
  int healthY;
  int healthW;
  int healthH;
  
  //rectangle around healthbar
  int hbx;
  int hby;
  int hbw;
  int hbh;

  //construct
  Player(int startingX, int startingY, int startingD) {
    x = startingX;
    y = startingY;
    d = startingD;
    c = #1B4D81;

    isHurt = false;

    //hitbox
    left = x-d/2;
    right = x+d/2;
    top = y - d/2;
    bottom = y + d/2;

    //halberd
    hx = x + d/2;
    hy = y;
    hw = 10;
    hh = 75;

    //weapon hitbox
    hl = hx-hw/2;
    hr = hx+hw/2;
    ht = hy - hh/2;
    hb = hy + hh/2;


    isMovingLeft = false;
    isMovingRight = false;
    isMovingUp = false;
    isMovingDown = false;

    speed = 10;

    //animation
    for (int i = 0; i<Khija_walking.length; i++) {
      Khija_walking[i] = loadImage("Khija_walking" + i + ".png");
    }
    
    for (int i = 0; i<kSwing.length; i++) {
      kSwing[i] = loadImage("hal_ani" + i + ".png");
    }

    pWalk = new Animation(Khija_walking, .08, 2);
    pSwing = new Animation(kSwing, .7, 2);

    // health bar vars
    healthX= 60;
    healthY= 25;
    healthW= 100;
    healthH= 25;
    
    hbx = 55;
    hby = 20;
    hbw = 112;
    hbh = 35;
  }

  //functions
  void render() {
    rectMode(CENTER);
    /*if (isTall==true) {
      hw=10;
      hh=75;
    } else {
      hw=75;
      hh=10;
      hy=y+d/3;
    }*/
     if(isTall==false){
      pSwing.isAnimating=true;
    }

    pWalk.display(p1.x, p1.y);
    pSwing.display(hx,hy);

    fill(color(#3A2963));
    circle(x, y, d);
    //rect(hx, hy, hw, hh);
   
  }

  void move() {
    //hitbox (wherever player moves, hitbox goes with it)
    left = x-d/2;
    right = x+d/2;
    top = y - d/2;
    bottom = y + d/2;

    //halberd moves with character
    hy = y - 10;
    hw = 10;
    hh = 75;

    //halberd hbox
    hl = hx-hw/2;
    hr = hx+hw+50;
    ht = hy - hh/2;
    hb = hy + hh/2;

    if (isMovingLeft == true) {
      x -= speed; //x=x-speed;
      hx = x - d/2;
      if (gSteps.isPlaying() == false) {
    gSteps.play();
  }
    }
    if (isMovingRight == true) {
      x += speed;
      hx = x + d/2;
      pWalk.isAnimating = true;
      if (gSteps.isPlaying() == false) {
    gSteps.play();
  }
    }
    if (isMovingUp == true) {
      y -= speed;
      pWalk.isAnimating = true;
      if (gSteps.isPlaying() == false) {
    gSteps.play();
  }
    }
    if (isMovingDown == true) {
      y += speed;
      pWalk.isAnimating = true;
      if (gSteps.isPlaying() == false) {
    gSteps.play();
  }
    }
    
 
  }

  void attack(Watope aWatope) {
    if (aWatope.top <= hb &&
      aWatope.bottom >= ht &&
      aWatope.right >= hl &&
      aWatope.left <= hr) {
      aWatope.shouldRemove = true;
      println("wack");
    }
    
    if(mousePressed){
      if (takeThat.isPlaying()==false) {
    takeThat.play();
  }
    }
  }

  void attack2(Watope2 aWatope2) {
    if (aWatope2.top <= hb &&
      aWatope2.bottom >= ht &&
      aWatope2.right >= hl &&
      aWatope2.left <= hr && aWatope2.healthW > 0) {
      aWatope2.healthW -= 30;
      println(aWatope2.healthW);
    }
    if (aWatope2.healthW <= 0) {
      aWatope2.shouldRemove = true;
    }
    
    if(mousePressed){
      if (takeThat.isPlaying()==false) {
    takeThat.play();
  }
    }
  }

  void attack3(Watope3 aWatope3) {
    if (aWatope3.top <= hb &&
      aWatope3.bottom >= ht &&
      aWatope3.right >= hl &&
      aWatope3.left <= hr && aWatope3.healthW > 0) {
      aWatope3.healthW -= 30;
      println("wack");
    }
    if (aWatope3.healthW <= 0) {
      aWatope3.shouldRemove = true;
    }
    if(mousePressed){
      if (takeThat.isPlaying()==false) {
    takeThat.play();
  }
    }
    
  }

  void wallDetect() {
    if (x-d/2 <= 0) {
      isMovingLeft=false;
      x+=speed;
    }
    if (x+d/2 >= width) {
      isMovingRight=false;
      x-=speed;
    }
    if (y-d/2 <= 0) {
      isMovingUp=false;
      y+=speed;
    }
    if (y+d/2 >= height) {
      isMovingDown=false;
      y-=speed;
    }
  }

  void healthBar() {

    //
    fill(c);
    rectMode(CORNER);
    rect(healthX, healthY, healthW, healthH);
    noFill();
    rect(hbx,hby,hbw,hbh);
    rectMode(CENTER);
    
    //
    if (healthW < 66){
       c = color(255,255,0); 
    }
    if (healthW < 33){
      c = color(255,0,0); 
    }
    
  if (keyPressed) {
    if (key == 'r') {
      healthW = 100;
      c = color(0,255,0);
    }
  }

  }
}
