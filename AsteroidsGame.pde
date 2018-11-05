//constants and declaration relating to player
Spaceship player;
double ACCELERATE_CONSTANT = 0.1;
int TURN_CONSTANT = 5;

//constants and declaration relating to star class
Star[] stars;
int numStar = 1000;

//booleans managing controls
boolean wIsPressed = false;
boolean aIsPressed = false;
boolean dIsPressed = false;

//int of size
int canvasSize = 500;

public void setup() {
  //sets up BG
  size(500, 500);
  background(0);
  
  //initializes all classes
  player = new Spaceship();
  stars = new Star[numStar];
  
  newStars();
}

public void draw() {
  background(0);
  
  //shows 1/2 stars in the background
  for (int i = 0; i < stars.length / 2; i++){stars[i].show();}

  //moves and shows player
  player.move();
  player.show();
  
  //shows last half of stars in the forground
  for (int i = stars.length / 2; i < stars.length; i++){stars[i].show();}
  
  //moves player
  controller();
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
  player.setX((int)(Math.random() * canvasSize));
  player.setY((int)(Math.random() * canvasSize));
  player.setDirectionX(0);
  player.setDirectionY(0);
  player.setPointDirection((int)(Math.random() * 360));
  newStars();
}

//set speed to 0
public void brake() {
  player.setDirectionX(0);
  player.setDirectionY(0);
}

//creates a new array of stars
public void newStars() {
    for (int i = 0; i < stars.length; i++){stars[i] = new Star(canvasSize);}
}
