import android.view.MotionEvent;
import java.util.*;
import ketai.ui.*;

KetaiGesture gesture;

List<Circle> mCircleList;

public class Circle {
  private float x;
  private float y;
  private float progress;
  
  public Circle(float x, float y) {
    this.x = x;
    this.y = y;
    this.progress = 0;
  }
  
  public void draw() {
    noStroke();
    fill(0, 0, 255 * (1 - progress), 255 * (1 - progress));
    ellipse(x, y, 300 * progress, 300 * progress);
    
    progress += 0.03;
  }
  
  public boolean isFinish() {
     if (1 <= progress) {
      return true;
    }
    return false;
  }
}

void setup() {
  background(255);
  
  mCircleList = new ArrayList<Circle>();
  
  gesture = new KetaiGesture(this);
}

void draw() {
  background(255);
  
  Iterator<Circle> it = mCircleList.iterator();
  while(it.hasNext()) {
    Circle c = it.next();
    if (c.isFinish()) {
      it.remove();
    } else {
      c.draw();
    }
  }
}

void onTap(float x, float y) {
  mCircleList.add(new Circle(x, y));
}

public boolean surfaceTouchEvent(MotionEvent event) {
  //call to keep mouseX, mouseY, etc updated
  super.surfaceTouchEvent(event);

  //forward event to class for processing
  return gesture.surfaceTouchEvent(event);
}