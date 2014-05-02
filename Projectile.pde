class Projectile implements Visible {
  float x, y, z, heading, radius, speed;
  int startTimeInMillis, clr;

  Projectile(float r_, float speed_, int clr_) {
    radius = r_;
    speed = speed_;
    clr = clr_;
    startTimeInMillis = millis();

    //copy the rest from the observer
    x = world.x;
    y = world.y;
    z = world.z;
    heading = world.heading;
  }

  void draw() {
    //You can move the sphere by changing x, y, z
    //or change the radius or color.
    //Can you get the sphere to blink on and off?
    float elapsedSeconds = (millis() - startTimeInMillis) * 0.001;
    if (elapsedSeconds > 3 ) {
      world.removeVisible(this);
    } 
    else {
      pushMatrix();
      fill(clr);
      float dx = speed * cos(heading) * elapsedSeconds;
      float dz = speed * sin(heading) * elapsedSeconds;
      translate(x - dx, y - 50, z - dz);
      noStroke();
      sphere(radius);
      popMatrix();
    }
  }
}

