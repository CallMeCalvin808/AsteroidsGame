class Asteroids extends Floater {
  private int mySizeFactor;
  private int myRotationSpeed;
  
  public Asteroids(int scale, float playerPosX, float playerPosY) {
    //sets corners of astroids
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    mySizeFactor = scale;
    
    //initializes all values for x corners
    xCorners[0] = 3 * mySizeFactor;
    xCorners[1] = 8 * mySizeFactor;
    xCorners[2] = 8 * mySizeFactor;
    xCorners[3] = 3 * mySizeFactor;
    xCorners[4] = -3 * mySizeFactor;
    xCorners[5] = -8 * mySizeFactor;
    xCorners[6] = -8 * mySizeFactor;
    xCorners[7] = -3 * mySizeFactor;
    
    //initializes all values for y corners
    yCorners[0] = 8 * mySizeFactor;
    yCorners[1] = 3 * mySizeFactor;
    yCorners[2] = -3 * mySizeFactor;
    yCorners[3] = -8 * mySizeFactor;
    yCorners[4] = -8 * mySizeFactor;
    yCorners[5] = -3 * mySizeFactor;
    yCorners[6] = 3 * mySizeFactor;
    yCorners[7] = 8 * mySizeFactor;
    
    //sets color
    myColor = 155;
    //initializes position
    if(Math.random() < 0.5)
      myCenterX = playerPosX - ((int)(Math.random() * 301) + 50);
    else
      myCenterX = (int)(Math.random() * 301 + 100) + playerPosX;
    if(Math.random() < 0.5)
      myCenterY = playerPosY - ((int)(Math.random() * 301) + 50);
    else
      myCenterY = (int)(Math.random() * 301 + 100) + playerPosY;
      
    //initializes speed
    myDirectionX = ((Math.random() * 5) - 2) / mySizeFactor;
    myDirectionY = ((Math.random() * 5) - 2) / mySizeFactor;
    myRotationSpeed = (10 / mySizeFactor) * ((int)(Math.random() * 5) - 2);
    
    if (myRotationSpeed == 0){
      if (Math.random() < 0.5)
        myRotationSpeed = -3;
      else
        myRotationSpeed = 3;
    }
  }
  
  public void move() {
    turn(myRotationSpeed);
    super.move();
  }
  
  public void randomizePosition() {
    //randomizes the position of each asteroid 
    myCenterX = (int)(Math.random() * 701);
    myCenterY = (int)(Math.random() * 701);
  }
  
  public void setX(int x) {myCenterX = x;}
  public int getX() {return (int)myCenterX;}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return (int)myCenterY;}
  
  public void setDirectionX(double x) {myDirectionX = x;}
  public double getDirectionX() {return myDirectionX;}
  public void setDirectionY(double y) {myDirectionY = y;}
  public double getDirectionY() {return myDirectionY;}
  public void setPointDirection(int n) {myPointDirection = n;}
  public double getPointDirection() {return myPointDirection;}
  
  public int getSize() {return mySizeFactor;}
}
