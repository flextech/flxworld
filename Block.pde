class Block implements Visible {
  float x, y, z, xSize, ySize, zSize;
  int clr;

  Block(float x_, float y_, float z_
    , float xSize_, float ySize_, float zSize_, int clr_) {
    x = x_;
    y = y_;
    z = z_; 
    xSize = xSize_;
    ySize = ySize_;
    zSize = zSize_;
    clr = clr_;
  }

  void draw() {
    pushMatrix();
    fill(clr);
    translate(x, y, z);
    float clrScale = 0.5;
    stroke(red(clr) * clrScale, green(clr) * clrScale, blue(clr) *clrScale);
    box(xSize, ySize, zSize);
    popMatrix();
  }
}
