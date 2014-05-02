class Sphere implements Visible {
  float x, y, z, radius;
  int clr;

  Sphere(float x_, float y_, float z_, float r_, int clr_) {
    x = x_;
    y = y_;
    z = z_; 
    radius = r_;
    clr = clr_;
  }

  void draw() {
    //You can move the sphere by changing x, y, z
    //or change the radius or color.
    //Can you get the sphere to blink on and off?
    x = map(world.lightLevel(), 0, 1, -1000, 1000);
    pushMatrix();
    fill(clr);
    translate(x, y, z);
    noStroke();
    sphere(radius);
    popMatrix();
  }
}

