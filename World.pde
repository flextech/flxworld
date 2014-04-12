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
    //forward
    if (eventManager.hasKey('w') ) {
      z -= stepSize;
    } 
    //backward
    if (eventManager.hasKey('s') ) {
      z += stepSize;
    }
    //go left
    if (eventManager.hasKey('a') ) {
      x -= stepSize;
    }
    //go right
    if (eventManager.hasKey('d') ) {
      x += stepSize;
    }
  }
}
