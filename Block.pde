class Block {
  float x, y, z, xSize, ySize, zSize;

  Block(float x_, float y_, float z_
    , float xSize_, float ySize_, float zSize_) {
    x = x_;
    y = y_;
    z = z_; 
    xSize = xSize_;
    ySize = ySize_;
    zSize = zSize_;
  }
  
  void draw() {
    translate(x, y, z);
    box(xSize, ySize, zSize);
  }
}
