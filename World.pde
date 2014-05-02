class World {
  ArrayList<Visible> visibles;
  float x, y, z;//position of Observer in space
  float heading = 0;//initial heading
  float stepSize = 10;//position increment when moving
  float headingStep = 0.04;//angle increment when turning
  float secondsPerDay = 30;

  World() {
    x = y = z = 0;
    visibles = new ArrayList<Visible>();

    //create some colored blocks so we have something to look at
    float blockSize = width / 6;
    float yBlockCenter = -blockSize /2 ;
    float blockSpacing = blockSize * 2;
    for (int i = 2; i <5 ; ++i) {
      visibles.add(new Block(blockSpacing * i, yBlockCenter, 0, blockSize, blockSize, blockSize, color(255, 0, 0)));
      visibles.add(new Block(-blockSpacing * i, yBlockCenter, 0, blockSize, blockSize, blockSize, color(255, 200, 200)));
      visibles.add(new Block(0, yBlockCenter, blockSpacing * i, blockSize, blockSize, blockSize, color(0, 0, 255)));
      visibles.add(new Block(0, yBlockCenter, -blockSpacing * i, blockSize, blockSize, blockSize, color(200, 200, 255)));
    }

    //Let's look at a yellow sphere!
    visibles.add(new Sphere(0, 0, 0, 50, color(255, 255, 0)));
  }

  void draw() {
    handleInput();

    //draw sky
    float skyBlueLevel = map(lightLevel(), 0, 1, 100, 255);
    float skyRedLevel = skyBlueLevel * 0.3;
    float skyGreenLevel = skyBlueLevel * 0.8;
    background(skyRedLevel, skyGreenLevel, skyBlueLevel);

    //draw ground
    fill(0, 200, 0);
    rotateX(PI / 2 );
    ellipse(0, 0, width * 20, width * 20);
    rotateX(-PI / 2 );

    //draw visibles
    translate(width/2, height/2, 0);
    rotateY(heading);
    float pixelsBelowEyeLevel = 60;
    camera(x, y - pixelsBelowEyeLevel, z, x - cos(heading), y - pixelsBelowEyeLevel, z - sin(heading), 0.0, 1.0, 0.0);
    for (Visible visible : visibles) {
      visible.draw();
    }
  }

  void handleInput() {
    //forward
    if (eventManager.hasKey('w') ) {
      x -= stepSize * cos(heading);
      z -= stepSize * sin(heading);
    } 
    //backward
    if (eventManager.hasKey('s') ) {
      x += stepSize * cos(heading);
      z += stepSize * sin(heading);
    }
    //turn left
    if (eventManager.hasKey('a') ) {
      heading -= headingStep ;
    }
    //turn right
    if (eventManager.hasKey('d') ) {
      heading += headingStep;
    }
    //go up
    if (eventManager.hasKey(' ') ) {
      y -= stepSize ;
    } 
    //go down
    if (eventManager.shiftIsPressed() ) {
      //fall back down, but don't fall below zero level.
      if ( y < 0) {
        y += stepSize;
      } 
      else {
        y = 0;
      }
    }
  }

  float lightLevel() {
    return map(sin(millis() * 0.001 * 2 * PI / secondsPerDay), -1, 1, 0, 1);
  }
}

