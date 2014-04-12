World world;

void setup() {
  size(640, 360, P3D);
  world = new World();
}

void draw() {
  world.draw();
}
