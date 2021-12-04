private class Obstacle {
  int x;
  int y;
  int counter;

  Obstacle(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void move()
  {
    x -= random(2, 3);
    y += random(-2, 4);
  }

  void render() {
    /////RENDER PLACEHOLDER/////
  }

  void update() {
    move();
    render();
  }
}
