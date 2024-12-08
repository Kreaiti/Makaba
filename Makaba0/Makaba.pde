 //sound
import processing.sound.*;
SoundFile gSteps;
SoundFile epic;
SoundFile slime;
SoundFile abomination;
SoundFile hulk;
SoundFile ouch;
SoundFile takeThat;
//music:
/*
Epic Chase by MaxKoMusic | https://maxkomusic.com/
 Music promoted by https://www.chosic.com/free-music/all/
 Creative Commons Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)
 https://creativecommons.org/licenses/by-sa/3.0/
 */


//declare vars
Player p1;

Obstacle o1;
Obstacle o2;
Obstacle2 ob1;
Obstacle2 ob2;

Watope w1;
Watope2 wa1;
Watope3 wat1;

//states
int state = 0;

//buttons
//Play
int bu1x;
int bu1y;
int bu1w;
int bu1h;

//
int bu2x;
int bu2y;
int bu2w;
int bu2h;

//
int bu3x;
int bu3y;
int bu3w;
int bu3h;
//
//button booleans
boolean isPlayPressed;
boolean isHowToPressed;
boolean isLevelsPressed;

//arraylist
ArrayList<Watope> w1List;
ArrayList<Watope2> w2List;
ArrayList<Watope3> w3List;

ArrayList<Player> playerList;


//time
int startTime;
int endTime;
int interval = 3000;

int watopeCounter1;
int watope2Counter1;
int watope3Counter1;

//images
PImage mainBG;
PImage sScreen;
//Kaskani
PImage ka1;
PImage ka2;
PImage ka3;
PImage ka4;
PImage ka5;
//Kusini
PImage ku1;
PImage ku2;
PImage ku3;
//Magabi
PImage ma1;
PImage ma2;
//
PImage halberd; 

void setup() {
  size(800, 600);
  imageMode(CENTER);
  textAlign(CENTER);

  //sound
  gSteps = new SoundFile(this, "grassSteps.wav");
  epic = new SoundFile(this, "epicChase1.wav");
  slime = new SoundFile(this, "watope_sound1.wav");
  abomination = new SoundFile(this, "watope_sound2.wav");
  hulk = new SoundFile(this, "watope_sound3.wav");
  ouch = new SoundFile(this, "playerHit.wav");
  takeThat = new SoundFile(this, "slash.wav");
  
  //images
  mainBG = loadImage("mainBG.png");
  sScreen = loadImage("menu.png");
  ka1 = loadImage("kaskani1.png");
   ka2 = loadImage("kaskani2.PNG");
    ka3 = loadImage("kaskani3.png");
     ka4 = loadImage("kaskani4.PNG");
      ka5 = loadImage("kaskani5.PNG");
   ku1 = loadImage("kusini1.PNG");
   ku2 = loadImage("kusini2.PNG");
   ku3 = loadImage("kusini3.PNG");
  ma1 = loadImage("magabi1.PNG");
  ma2 = loadImage("magabi2.PNG");
  
  // init. vars
  p1 = new Player(width/2, height/2, 10);

  o1 = new Obstacle(width/2, 10, 200, 200);
  o2 = new Obstacle(30, 10, 200, 200);
  ob1 = new Obstacle2(100, 540, 200, 100);
  ob2 = new Obstacle2(700, 570, 100, 100);
  
  w1= new Watope();
  wa1 = new Watope2();
  wat1 = new Watope3();

  playerList = new ArrayList<Player>();
  playerList.add(p1);

  w1List = new ArrayList<Watope>();
  w1List.add(w1);

  w2List = new ArrayList<Watope2>();
  w2List.add(wa1);

  w3List = new ArrayList<Watope3>();
  w3List.add(wat1);

  //
  bu1x = width-width/5;
  bu1y = height/3;
  bu1w = 200;
  bu1h = 80;
  //
  bu2x = bu1x;
  bu2y = bu1y + 100;
  bu2w = bu1w;
  bu2h = bu1h;
  //
  bu3x = bu1x;
  bu3y = bu2y + 100;
  bu3w = bu1w;
  bu3h = bu1h;

  //time
  startTime=millis();
}


void draw() {
  background(42);
  endTime=millis();
  //music
  if (epic.isPlaying()==false) {
    epic.play();
  }

  // case
  switch(state) {
  case 0:
    startScreen();
    break;

  case 1:
    plKaskani();
    break;

  case 2:
    plKusini();
    break;

  case 3:
    plMagabi();
    break;

  case 5:
    deathScreen();
    break;

  case 6:
    winScreen();
    break;

  case 7:
    howToPlay();
    break;

  case 8:
    levels();
    break;
  }
}

//always have key pressed function in the "sketch" tab
void keyPressed() {
  if (key == 'a') {
    p1.isMovingLeft = true;
  }
  if (key == 'd') {
    p1.isMovingRight = true;
  }
  if (key == 'w') {
    p1.isMovingUp = true;
  }
  if (key == 's') {
    p1.isMovingDown = true;
  }

}

//what goes must stop at some point
void keyReleased() {
  if (key == 'a') {
    p1.isMovingLeft = false;
  }
  if (key == 'd') {
    p1.isMovingRight = false;
  }
  if (key == 'w') {
    p1.isMovingUp = false;
  }
  if (key == 's') {
    p1.isMovingDown = false;
  }
}

void mousePressed() {
  p1.isTall=false;
  p1.attack(w1);

}

void mouseReleased() {
  p1.isTall=true;
}

void startScreen() {
  rectMode(CENTER);
  textSize(200);
  image(sScreen, width/2, height/2);
  fill(#235AFA);
  text("Makaba", width/2, height/5);
  
fill(#FFFFFF);
  drawButton(bu1x, bu1y, bu1w, bu1h);
  fill(42);
  textSize(50);
  text("Play", bu1x, bu1y+bu1h/4);

  //
  fill(#FFFFFF);
  drawButton(bu2x, bu2y, bu2w, bu2h);
  fill(42);
  textSize(35);
  text("How To Play", bu2x, bu2y+bu2h/4);
  //
  fill(#FFFFFF);
  drawButton(bu3x, bu3y, bu3w, bu3h);
  fill(42);
  textSize(50);
  text("Levels", bu3x, bu3y+bu3h/4);
  //
  fill(#FFFFFF);
  
  //click
  if(mousePressed){
    if (isInButton(bu1x, bu1y, bu1w, bu1h)==true && state==0) {
    isPlayPressed=true;
    state+=1;
    println("play");
  } 
  else if (isInButton(bu2x, bu2y, bu2w, bu2h)==true){
    isHowToPressed = true;
    state=7;
    println("learn");
  } 
  else if (isInButton(bu3x, bu3y, bu3w, bu3h)==true){
    isLevelsPressed = true;
    state=8;
    println("Levels");
  }
  }
  
 
    
  
}

void drawButton(int x, int y, int w, int h) {

  rect(x, y, w, h);
}

boolean isInButton(int x, int y, int w, int h) {
  //vars
  int top = y - h/2;
  int bottom = y + h/2;
  int left = x - w/2;
  int right = x + w/2;

  //if statement
  if (mouseX < right &&
    mouseX > left &&
    mouseY > top &&
    mouseY < bottom) {
    return true;
  } else {
    return false;
  }
}

void plKaskani() {

 //background
 background(#553727);
 image(ka1, width/2, height/2);
 image(ka2, o2.x, o2.y);
 
 o1.render();
 o1.collideP(p1);
 o2.render();
 o2.collideP(p1);
 
 ob1.render();
 ob1.collideP(p1);
 ob2.render();
 ob2.collideP(p1);
 image(ka3, o1.x, o1.y);
 image(ka5, ob2.x, ob2.y);
 image(ka4, ob1.x, ob1.y);



  //arraylist loops
  for (Player aPlayer : playerList) {
    aPlayer.render();
    aPlayer.move();
    aPlayer.wallDetect();
    aPlayer.healthBar();
    
    // if player health goes to 0, then go to death screen
    if (aPlayer.healthW <= 0){
       state = 5; 
    }

    for (Watope aWatope : w1List) {
      aWatope.render();
      aWatope.move(aPlayer);
      aWatope.collide(aPlayer);
      aPlayer.attack(aWatope);
    }
  }
  for (int i = w1List.size()-1; i >= 0; i = i-1) {
    Watope aWatope = w1List.get(i);

    if (aWatope.shouldRemove == true && p1.isTall == false) {
      w1List.remove(aWatope);
    }
  }

  //adding monsters
  if (endTime - startTime > interval && watopeCounter1 < 30) {
    w1List.add(new Watope());
    watopeCounter1++;
    startTime=millis();
  }

  //next level
  if (watopeCounter1 == 30 && state==1 && p1.x>=width-50) {
    state += 1;
    println("Kusini");
    p1.x = 0;
  }
}


void plKusini() {
   //background
 background(#61737E);
 image(ku1, width/2, height/2);
 image(ku2, ob1.x, ob1.y);
 image(ku3, ob2.x, ob2.y);
  
  //arraylist loops
  for (Player aPlayer : playerList) {
    aPlayer.render();
    aPlayer.move();
    aPlayer.wallDetect();
    aPlayer.healthBar();
    
     // if player health goes to 0, then go to death screen
    if (aPlayer.healthW <= 0){
       state = 5; 
    }

    for (Watope2 aWatope2 : w2List) {
      aWatope2.render();
      aWatope2.move(aPlayer);
      aWatope2.collide(aPlayer);
      aWatope2.health();
      aPlayer.attack2(aWatope2);
    }
  }
  for (int i = w2List.size()-1; i >= 0; i = i-1) {
    Watope2 aWatope2 = w2List.get(i);

    if (aWatope2.shouldRemove == true && p1.isTall == false) {
      w2List.remove(aWatope2);
    }
  }

  //adding monsters
  if (endTime - startTime > interval && watope2Counter1 < 20) {
    w2List.add(new Watope2());
    watope2Counter1++;
    startTime=millis();
  }

  //next level
  if (watope2Counter1 == 20 && state==2 && p1.x>=width-50) {
    state += 1;
    println("Magabi");
    p1.x = 0;
  }
}

void plMagabi() {
  image(ma1, width/2, height/2);
  image(ma2, o1.x, o1.y);
  
  //arraylist loops
  for (Player aPlayer : playerList) {
    aPlayer.render();
    aPlayer.move();
    aPlayer.wallDetect();
    aPlayer.healthBar();

 // if player health goes to 0, then go to death screen
    if (aPlayer.healthW <= 0){
       state = 5; 
    }

    for (Watope3 aWatope3 : w3List) {
      aWatope3.render();
      aWatope3.move(aPlayer);
      aWatope3.collide(aPlayer);
      aWatope3.health();
      aPlayer.attack3(aWatope3);
    }
  }
  for (int i = w3List.size()-1; i >= 0; i = i-1) {
    Watope3 aWatope3 = w3List.get(i);

    if (aWatope3.shouldRemove == true && p1.isTall == false) {
      w3List.remove(aWatope3);
    }
  }

  //adding monsters
  if (endTime - startTime > interval && watope3Counter1 < 10) {
    w3List.add(new Watope3());
    watope3Counter1++;
    startTime=millis();
  }

  //next level
  if (watope3Counter1 == 10 && state==3 && p1.x>=width-50) {
    state = 6;
    println("Magabi");
    p1.x = 0;
  }
  
  if(keyPressed){
    if(key == 'l'){
      state = 6;
    }
  }
}


void deathScreen() {
  text("You left them to perish", width/2, height/4);
  
  //return
  textSize(25);
  text("Press 'r' to Return to Menu", width/2, height - height/5);

  if (keyPressed) {
    if (key == 'r') {
      state = 0;
    }
  }
  
  p1.healthBar();
}

void winScreen() {
  text("Chiyalaka is saved!", width/2, height/4);
  for (Player aPlayer : playerList) {
    aPlayer.render();
    aPlayer.move();
    aPlayer.wallDetect();
    aPlayer.healthBar();
  }
  p1.x=width/2;
  p1.healthBar();
  
  //return
  textSize(25);
  text("Press 'r' to Return to Menu", width/2, height - height/5);

  if (keyPressed) {
    if (key == 'r') {
      state = 0;
    }
  }
  
}

void howToPlay() {
  image(mainBG, width/2,height/2);
  //Title
  textSize(80);
  textAlign(CENTER);
  text("How To Play", width/2, 100);
  //tuto
  textSize(40);
  text("WASD to move. Click mouse to kill mobs.", width/2, 180);
  text("Move right when all mobs are dead.", width/2, 240);


  //return
  textSize(25);
  text("Press 'r' to Return", width/2, height - height/3);

  if (keyPressed) {
    if (key == 'r') {
      state = 0;
    }
  }
}

void levels() {
  rectMode(CENTER);
  image(mainBG, width/2,height/2);
  //need boxes, maybe with images?
  int l2x = width/2;
  int l2y = height/2;
  int l2w = 200;
  int l2h = 200;
  //
  int l1x = l2x - l2w - 40;
  int l1y = l2y;
  int l1w = l2w;
  int l1h = l2h;
  //
  int l3x = l2x + l2w + 40;
  int l3y = l2y;
  int l3w = l2w;
  int l3h = l2h;

  //create boxes
  //1st=L2
  fill(#FFFFFF);
  rect(l2x, l2y, l2w, l2h);
  textSize(180);
  textAlign(CENTER);
  fill(42);
  text("2", l2x, l2y+l2w/4);
  //L1
  fill(#FFFFFF);
  rect(l1x, l1y, l1w, l1h);
  textSize(180);
  textAlign(CENTER);
  fill(42);
  text("1", l1x, l1y+l1w/4);
  //L3
  fill(#FFFFFF);
  rect(l3x, l3y, l3w, l3h);
  textSize(180);
  textAlign(CENTER);
  fill(42);
  text("3", l3x, l3y+l3w/4);

  if (mousePressed) {
    if (isInButton(l2x, l2y, l2w, l2h)==true) {
      state = 2;
      p1.x = 0;
    } else if (isInButton(l1x, l1y, l1w, l1h)==true) {
      state = 1;
      p1.x = 0;
    } else if (isInButton(l3x, l3y, l3w, l3h)==true) {
      state = 3;
      p1.x = 0;
    }
  }

  //return
  textSize(25);
  text("Press 'r' to Return", width/2, height - height/5);

  if (keyPressed) {
    if (key == 'r') {
      state = 0;
    }
  }
  //need return button (text at bottom of screen)
}
