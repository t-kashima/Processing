import processing.video.*;

Capture mCamera;

private static final int D = 10;

void setup() {
  size(320, 240);
  this.mCamera = new Capture(this, width, height, 15);
  this.mCamera.start();
  smooth();
  noStroke();
}

void draw() {
  background(0);
  
  this.mCamera.loadPixels();
  
  for(int y = D / 2; y < height; y += D) {
    for(int x = D / 2; x < width; x += D) {
      fill(mCamera.pixels[y * width + x]);
      ellipse(x, y, D, D);
    }
  }
}

void captureEvent(Capture camera){
 camera.read();
}