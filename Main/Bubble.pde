private class Bubble extends Obstacle {

  PImage bubble1, bubble2;

  Bubble(int x, int y) {
    super(x, y);
    bubble1 = loadImage("bubble1.png");
    bubble2 = loadImage("bubble2.png");
  }

  @Override
    void render() {

    if (counter>0 & counter<=50)
    {
      image(bubble1, x, y);
    } else 
    {
      image(bubble2, x, y);
    } 
    counter = counter + 1;
    if (counter>100)
      counter = 0;
  }
}
