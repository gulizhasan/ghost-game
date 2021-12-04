private class Bird extends Obstacle {

  PImage bird1;
  PImage bird2;
  PImage bird3;

  Bird(int x, int y) {
    super(x, y);
    bird1 = loadImage("bird1.png");
    bird2 = loadImage("bird2.png");
    bird3 = loadImage("bird3.png");
  }

  @Override
    void render() {

    if (counter>0 & counter<=10)
    {
      image(bird1, x, y);
    } else if (counter>10 & counter<=20)
    {
      image(bird2, x, y);
    } else
    {
      image(bird3, x, y);
    }
    counter = counter + 1;
    if (counter>30)
      counter = 0;
  }
}
