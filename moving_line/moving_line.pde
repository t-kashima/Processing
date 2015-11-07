private enum LineType {
  HIGH,
  LOW
};

public class Line {
  private float mProgress;
  private LineType mLineType;
  
  public Line(LineType lineType) {
    this.mProgress = 0;
    this.mLineType = lineType;
  }
  
  public void draw() {
    stroke(255);
    noFill();

    this.draw(this.mProgress, this.mLineType);
    
    this.mProgress += 0.01;    
    if (1 < this.mProgress) {
      this.mProgress = 0;
    }
  }
  
  private void draw(float progress, LineType lineType) {
    int lineWidth = (int)(width * progress);
    int x = width / 2 - lineWidth / 2;
    int y;    
    switch(lineType) {
      case HIGH:
        y = (int)(height / 2 - (height / 2 * progress));
        break;
      case LOW:
        y = (int)(height / 2 + (height / 2 * progress));      
        break;
      default:
        y = 0;
        break;
    }
    line(x, y, x + lineWidth, y);    
  }
}

private Line mLineHigh;
private Line mLineLow;

void setup() {
  size(800, 800);
  
  this.mLineHigh = new Line(LineType.HIGH);
  this.mLineLow = new Line(LineType.LOW);  
}

void draw() {
  background(0);
  
  this.mLineHigh.draw();
  this.mLineLow.draw();  
}