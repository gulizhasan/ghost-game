private class Plane extends Obstacle {

  PImage plane1, plane2;

  Plane(int x, int y) {
    super(x, y);
    plane1 = loadImage("plane1.png");
    plane2 = loadImage("plane2.png");
  }

  @Override
    void render() {

    if (counter>0 & counter<=200)
    {
      image(plane1, x, y);
    } else 
    {
      image(plane2, x, y);
    } 
    counter = counter + 1;
    if (counter>400)
      counter = 0;
  }
}
