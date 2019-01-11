//constants and declaration relating to player
Spaceship player;
double ACCELERATE_CONSTANT = 0.1;
int TURN_CONSTANT = 5;

ArrayList <Bullet> bulletList = new ArrayList<Bullet>();
int maxBullets = 5;
int currentAmmo = maxBullets;

ArrayList <Asteroids> asteroidList = new ArrayList<Asteroids>();
int INITIAL_NUM_ASTEROIDS = 11;
int MIN_ASTEROID_SIZE = 3;
int MAX_ASTEROID_SIZE = 10;

int numAsteroids = INITIAL_NUM_ASTEROIDS;
int additionalAsteroids = 1;

boolean isInvincible = true;
int inTimer = 0;
int inLength = 500;

//constants and declaration relating to star class
Star[] stars;
int NUM_STARS = 500;

//booleans managing controls
boolean wIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;

boolean isStart = true;

//int of size
int canvasSize = 700;

//score
int score = 0;

public void setup() {
  //sets up BG
  size(700,700);
  background(0);
  
  noLoop();
  //initializes all classes
  player = new Spaceship();
  stars = new Star[NUM_STARS];
  
  newStars();
  newAsteroids();
}

public void draw() {
  background(0);
  
  //shows 1/2 stars in the background
  for (int i = 0; i < stars.length / 2; i++){stars[i].show();}

  //moves and shows player
  player.move();
  player.show();
  
  for (int i = 0; i < bulletList.size(); i++){
    bulletList.get(i).show();
    bulletList.get(i).move();
  }
  
  //shows last half of stars in the forground
  for (int i = stars.length / 2; i < stars.length; i++){stars[i].show();}
  
  for (int i = 0; i < asteroidList.size(); i++){
    asteroidList.get(i).show();
    asteroidList.get(i).move();
  }
  
  //moves player
  controller();
  
  invincibility();
  //removes asteroids if close
  checkPlayerContact();
  checkBulletLocation();
  checkBulletContact();
    //healthbar
  player.healthbar();
  
  infoScreen();
  
  if(isStart)
    startScreen();
  
  
  if (player.getHealth() == 0)
    loseScreen();
    
  if (score == 1000)
    winGame();
}

//Handles button presses
public void keyPressed() {
    //booleans tracking if the player is moving
  if (key == 'w'){
    wIsPressed = true;
    player.setIsAccelerating(true);
  }
    
  if (key == 'd'){dIsPressed = true;}
  if (key == 'a'){aIsPressed = true;}
    
  //triggers 2 separate funtions 
  if (key == 'q'){hyperspace();}
  if (key == 'e'){brake();}
  
  if (key == 'o' && isInvincible == false){shoot();}
    
  if (key == 's' && isStart == true){
    isStart = false;
    loop();
  }
}

//resets bolleans controlled by keys when released
public void keyReleased() {
  if (key == 'w'){
    wIsPressed = false;
    player.setIsAccelerating(false);
  }

  if (key == 'd'){dIsPressed = false;}
  if (key == 'a'){aIsPressed = false;}
}

//moves player depending on boolean
public void controller() {
  if (wIsPressed == true) {player.accelerate(ACCELERATE_CONSTANT);}
  if (dIsPressed == true) {player.turn(TURN_CONSTANT);}
  if (aIsPressed == true) {player.turn(-TURN_CONSTANT);}
}

//stops player movement, changes stars, and changes player's position
public void hyperspace() {
  clearBullets();
  clearAsteroids();
  newAsteroids();
  
  player.setX((int)(Math.random() * canvasSize));
  player.setY((int)(Math.random() * canvasSize));
  player.setDirectionX(0);
  player.setDirectionY(0);
  player.setPointDirection((int)(Math.random() * 360));
  newStars();
  
  for (int i = 0; i < asteroidList.size(); i++){
    asteroidList.get(i).randomizePosition();
  }
  
  isInvincible = true;
  inTimer = 0;
}

//set speed to 0
public void brake() {
  player.setDirectionX(0);
  player.setDirectionY(0);
}

public void shoot() {  
  if (bulletList.size() < maxBullets){
    bulletList.add(new Bullet(player));
  }
}

//function that erases asteroids
public void checkPlayerContact() {
  for (int i = 0; i < asteroidList.size(); i++){
    float space =  dist(player.getX(), player.getY(), asteroidList.get(i).getX(), asteroidList.get(i).getY());
    int sizeI = asteroidList.get(i).getSize() * 10;
    
    if (isInvincible == false){
      if (space <= sizeI){
        asteroidList.remove(i);
        player.setHealth(player.getHealth() - 1);
      }
    }
  }
}

public void checkBulletContact() {
  if (bulletList.size() > 0 && asteroidList.size() > 0){
    for (int i = 0; i < bulletList.size(); i++){
      for (int j = 0; j < asteroidList.size(); j++){
        Bullet currentB = bulletList.get(i);
        Asteroids currentA = asteroidList.get(j);
        float d = dist(currentB.getX(), currentB.getY(), currentA.getX(), currentA.getY()); 
        int sizeI = currentA.getSize() * 10;
        
        if (d <= sizeI){
          bulletList.remove(i);
          asteroidList.remove(j);
          score += 10;
          break;
        }
      }
    }
  }
}

public void invincibility(){
  if (inTimer < inLength){
    if (isInvincible == true && inTimer < inLength){
      inTimer++;
      player.shield(inTimer / 2);
    }
  }
  
  if (inTimer >= inLength){
    isInvincible = false;
  }
}

//creates a new array of stars
public void newStars() {
  for (int i = 0; i < stars.length; i++){stars[i] = new Star(canvasSize);}
}

public void newAsteroids() {
  for (int i = 0; i < numAsteroids; i++){
    int asteroidSize = (int)(Math.random() * (MAX_ASTEROID_SIZE - MIN_ASTEROID_SIZE + 1) + MIN_ASTEROID_SIZE);
    asteroidList.add(new Asteroids(asteroidSize));
  }
  
  numAsteroids += additionalAsteroids;
}

public void clearAsteroids() {
  for (int i = 0; i < asteroidList.size(); i++){
    if (asteroidList.get(0) != null){
      asteroidList.remove(0);
      i--;
    }
  }
}

public void clearBullets() {
  for (int i = 0; i < bulletList.size(); i++){
    if (bulletList.get(0) != null){
      bulletList.remove(0);
      i--;
    }
  }
}

public void checkBulletLocation() {
  for (int i = 0; i < bulletList.size(); i++){
    if(bulletList.get(i).getX() >width)
    {     
      bulletList.remove(i);
      i--;
      break; 
    }    
    else if (bulletList.get(i).getX()<0)
    {     
      bulletList.remove(i);
      i--;
      break;  
    }    
    if(bulletList.get(i).getY() >height)
    {    
      bulletList.remove(i);
      i--;
      break;    } 
    
    else if (bulletList.get(i).getY() < 0)
    {     
      bulletList.remove(i);
      i--;
      break;
    }
  }
}

public void infoScreen () {
  textSize(64);
  fill(255);
  text("Score: " + score, 10, 64);
  
  ammoScreen();
}

public void ammoScreen() {
  currentAmmo = maxBullets - bulletList.size();
  
  int myPositionX = 20;
  int myPositionY = 100;
  
  for (int i = 0; i < currentAmmo; i++) {
    fill(#FFFCAD);
    stroke(0);
    strokeWeight(2);
    ellipse(myPositionX + (i * 50), myPositionY, 30, 30);
    rect(myPositionX + (i * 50), myPositionY - 15, 30, 30);
  }
}

public void startScreen() {
  background(0);
  
  fill(0, 0, 255);
  textSize(64);
  text("Blue Star", 210, 200);
  
  fill(255);
  textSize(32);
  text("W to Move", 270, 250);
  text("A + D to Turn", 245, 290);
  text("Q to Hyperspace", 220, 330);
  text("E to Brake", 270, 370);
  text("O to Shoot", 265, 410);
  text("S to Start", 270, 550);
}

public void loseScreen() {
  noLoop();
  background(0);
  fill(255, 0, 0);
  textSize(64);
  text("You Lose", 220, 250);
  
  textSize(32);
  fill(255);
  text("Your Score: " + score + "", 200, 300);
  text(losingText(), 200, 340);
}

public String losingText() {
  String text = "";
  
  if (score < 100)
    text = "Is that really your best?";
  else if (score >= 100 && score < 500)
    text = "Better luck next time";
  else if (score >= 500 && score < 800)
    text = "Go for 1000 points next time";
  else if (score >= 800 && score < 1000)
    text = "So Close!";
    
  return text;
}

public void winGame() {
  noLoop();
  background(0);
  fill(0, 0, 255);
  textSize(64);
  text("You Win!", 220, 250);
}
