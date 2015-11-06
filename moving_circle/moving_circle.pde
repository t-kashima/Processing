private enum Direct {
  LEFT,
  TOP,
  RIGHT,
  BOTTOM
};

public class Circle {
  private static final int CIRCLE_SIZE = 100;
  private static final int SPEED = 10;
  
  private Direct mDirect;
  private float mX;
  private float mY;
  
  public Circle(float startX, float startY) {
    this.mDirect = Direct.TOP;
    this.mX = startX;
    this.mY = startY;
  }
  
  public void draw() {
    switch(mDirect) {
      case LEFT:
        mX -= SPEED;
        if (0 > (mX - CIRCLE_SIZE / 2)) {
          mDirect = Direct.RIGHT;
          mX = CIRCLE_SIZE / 2;
        }         
        break;
      case TOP:
        mY -= SPEED;
        if (0 > (mY - CIRCLE_SIZE / 2)) {
          mDirect = Direct.BOTTOM;
          mY = CIRCLE_SIZE / 2;
        }         
        break;
      case RIGHT:
        mX += SPEED;
        if (width < (mX + CIRCLE_SIZE / 2)) {
          mDirect = Direct.LEFT;
          mX = width - CIRCLE_SIZE / 2;
        }        
        break;        
      case BOTTOM:
        mY += SPEED;
        if (height < (mY + CIRCLE_SIZE / 2)) {
          mDirect = Direct.TOP;
          mY = height - CIRCLE_SIZE / 2;
        }        
        break;
      default:
        break;
    }
    
    noStroke();
    fill(255);
    ellipse(mX, mY, CIRCLE_SIZE, CIRCLE_SIZE); 
  }
}

private Circle mCircle;

void setup() {
  size(800, 800);
  
  this.mCircle = new Circle(width / 2, height / 2);
}

void draw() {
  background(0);
  
  this.mCircle.draw();
}