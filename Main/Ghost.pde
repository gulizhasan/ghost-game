private class Ghost extends Obstacle {

  PImage img1, img2, img3;

  Ghost(int x, int y) {
    super(x, y);
    img1 = loadImage("ghost1.png");
    img2 = loadImage("ghost2.png");
    img3 = loadImage("ghost3.png");
  }

  @Override
  void render() {

    if (counter>0 & counter<=8)
    {
      image(img1, this.x, this.y);
    } else if (counter>8 & counter<=16)
    {
      image(img2, this.x, this.y);
    } else
    { 
      image(img3, this.x, this.y);
    }
    counter = counter + 1;
    if (counter>24)
      counter = 0;
  }

  ////////COLLISION DETECTION/////////

  boolean pop (Bubble bubble) {
    return abs(this.x-bubble.x) < 75 && abs(this.y - bubble.y) <78;
  }

  boolean crash (Obstacle plane) {
    return abs(this.x-plane.x) < 50 && abs(this.y - plane.y) <70;
  }

  boolean kill (Obstacle bird) {
    return abs(this.x-bird.x) < 10 && abs(this.y - bird.y) <10;
  }
}
