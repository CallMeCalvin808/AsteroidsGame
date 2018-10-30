class Spaceship extends Floater  
{   
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
      
      myCenterX = myCenterY = 250;
      myDirectionX = myDirectionY = 0;
      myPointDirection = 360;
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
}
