class Projectile implements Visible {
  float x, y, z, heading, radius, speed, verticalSpeed;
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
    verticalSpeed=400*(world.lookDownInPixels-60);
  }

  void draw() {
    //You can move the sphere by changing x, y, z
    //or change the radius or color.
    //Can you get the sphere to blink on and off?
    float elapsedSeconds = (millis() - startTimeInMillis) * 0.001;
    float dx = speed * cos(heading) * elapsedSeconds;
    float dz = speed * sin(heading) * elapsedSeconds;
    float gravity=50;
    float newY = y -50 - (elapsedSeconds * verticalSpeed -gravity * elapsedSeconds * elapsedSeconds );

    if (newY > 0 ) {
      world.removeVisible(this);
    } 
    else {
      pushMatrix();
      fill(clr);
      translate(x - dx, newY, z - dz);
      noStroke();
      sphere(radius);
      popMatrix();
    }
  }
}
