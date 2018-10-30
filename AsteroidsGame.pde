Spaceship player = new Spaceship();
double accelerateConstant = 0.1;
int turnConstant = 10;

public void setup() {
  size(500,500);
  background(255);
}

public void draw() {
  background(255);
  
  player.show();
  player.move();
}

public void keyPressed() {
    if (key == 'w'){player.accelerate(accelerateConstant);}
    if (key == 's'){player.accelerate(-accelerateConstant);}
    if (key == 'd'){player.turn(turnConstant);}
    if (key == 'a'){player.turn(-turnConstant);}
}
