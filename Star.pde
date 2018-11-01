class Star //note that this class does NOT extend Floater
{
  int myX, myY;
  int myR, myG, myB;
  
  public Star(int size) {
    myX = (int)(Math.random() * size);
    myY = (int)(Math.random() * size);
    myR = (int)(Math.random() * 255);
    myG = (int)(Math.random() * 255);
    myB = (int)(Math.random() * 255);
  }
  
  public void show() {
    fill(myR, myG, myB);
    stroke(myR, myG, myB);
    ellipse(myX, myY, 2, 2);
  }
}
