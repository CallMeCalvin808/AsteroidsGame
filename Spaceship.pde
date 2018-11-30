class Spaceship extends Floater  
{   
  //tracks whether or not player is accelerating
  private boolean isAccelerating;
  private int health;
  
    //constructor for player class
    public Spaceship() {
      corners = 10;
      xCorners = new int[corners];
      yCorners = new int[corners];
      
      //sets all of the x corners value
      xCorners[0] = 16;
      xCorners[1] = 4;
      xCorners[2] = 4;
      xCorners[3] = 0;
      xCorners[4] = -10;
      xCorners[5] = -4;
      xCorners[6] = -10;
      xCorners[7] = 0;
      xCorners[8] = 4;
      xCorners[9] = 4;
      
      //sets all the ycorners values
      yCorners[0] = 0;
      yCorners[1] = 3;
      yCorners[2] = 10;
      yCorners[3] = 4;
      yCorners[4] = 7;
      yCorners[5] = 0;
      yCorners[6] = -7;
      yCorners[7] = -4;
      yCorners[8] = -10;
      yCorners[9] = -3;
      
      myColor = #0000FF;
      
      //initializes player at start of the game
      myCenterX = myCenterY = 350;
      myDirectionX = myDirectionY = 0;
      myPointDirection = 360;
      
      isAccelerating = false;
      health = 5;
    }
    
    public void setIsAccelerating (boolean bool) {isAccelerating = bool;}
    
    public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);
    
    showEngine();
    
    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
  
  //function to make moving animation
    public void showEngine(){
      if (isAccelerating) {
        fill(255, 0, 0);
        stroke(255, 0, 0);
        
        beginShape();
        vertex(-5, 0);
        vertex(-10, 6);
        vertex(-18, 4);
        vertex(-14, 2);
        vertex(-20, 0);
        vertex(-14, -2);
        vertex(-18, -4);
        vertex(-10, -6);
        endShape();
      }
    }
    
    public void healthbar() {
      if (health > 0){
        double healthbarPosX = getX() - 25;
        double healthbarPosY = getY() - 30;
        
        for (int i = 0; i < health; i++){
          fill(0, 255, 0);
          stroke(255);
          strokeWeight(1);
          
          rect((float)healthbarPosX + 10 * i, (float)healthbarPosY, 10, 10);
        }
      }
    }
    
    public void setX(int x){myCenterX = x;}
    public int getX() {return (int)myCenterX;}
    public void setY(int y){myCenterY = y;}
    public int getY(){return (int)myCenterY;}
    
    public void setDirectionX(double x){myDirectionX = x;}
    public double getDirectionX(){return myDirectionX;}
    public void setDirectionY(double y){myDirectionY = y;}
    public double getDirectionY(){return myDirectionY;}
    public void setPointDirection(int degrees){myPointDirection = degrees;}
    public double getPointDirection(){return myPointDirection;}
    
    public void setHealth(int h){health = h;}
    public int getHealth(){return health;}
}
