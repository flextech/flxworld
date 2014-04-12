class World {
  Block aBlock;
  float x, z;
  float stepSize = 3;

  World() {
    aBlock = new Block(100, -50, 0, 100, 200, 50);
  }

  void draw() {
    background(200);
    translate(width/2 - x, height/2, z);
    handleInput();
    aBlock.draw();
  }

  void handleInput() {
    if (keyPressed) {
      if (key == 'w') {
        z += stepSize;
      } 
      else if (key == 's') {
        z -= stepSize;
      }
      else if (key == 'a') {
        x -= stepSize;
      }
      else if (key == 'd') {
        x += stepSize;
      }
    }
  }
}
