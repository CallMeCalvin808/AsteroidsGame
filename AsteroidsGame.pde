Spaceship player;
double ACCELERATE_CONSTANT = 0.1;
int TURN_CONSTANT = 10;

Star[] stars;
int numStar = 1000;

boolean wIsPressed = false;
boolean aIsPressed = false;
boolean sIsPressed = false;
boolean dIsPressed = false;

int canvasSize = 500;

public void setup() {
  size(500, 500);
  background(0);
  
  player = new Spaceship();
  stars = new Star[numStar];
  
  newStars();
}

public void draw() {
  background(0);
  
  for (int i = 0; i < stars.length / 2; i++){stars[i].show();}

  player.show();
  player.move();
  
  for (int i = stars.length / 2; i < stars.length; i++){stars[i].show();}
  
  controller();
}

public void keyPressed() {
    if (key == 'w'){wIsPressed = true;}
    if (key == 's'){sIsPressed = true;}
    if (key == 'd'){dIsPressed = true;}
    if (key == 'a'){aIsPressed = true;}
    if (key == 'q'){hyperspace();}
    if (key == 'e'){brake();}
}

public void keyReleased() {
  if (key == 'w'){wIsPressed = false;}
  if (key == 's'){sIsPressed = false;}
  if (key == 'd'){dIsPressed = false;}
  if (key == 'a'){aIsPressed = false;}
}

public void controller() {
  if (wIsPressed == true) {player.accelerate(ACCELERATE_CONSTANT);}
  if (sIsPressed == true) {player.accelerate(-ACCELERATE_CONSTANT);}
  if (dIsPressed == true) {player.turn(TURN_CONSTANT);}
  if (aIsPressed == true) {player.turn(-TURN_CONSTANT);}
}

public void hyperspace() {
  player.setX((int)(Math.random() * canvasSize));
  player.setY((int)(Math.random() * canvasSize));
  player.setDirectionX(0);
  player.setDirectionY(0);
  player.setPointDirection((int)(Math.random() * 360));
  
  newStars();
}

public void brake() {
  player.setDirectionX(0);
  player.setDirectionY(0);
}

public void newStars() {
    for (int i = 0; i < stars.length; i++){stars[i] = new Star(canvasSize);}
}
