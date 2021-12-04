//////////////////////////////////////////////////////////////////////////////////
////////////////GULIZ HASAN, 20049623, PROGRAMMING ASSIGNMENT/////////////////////
///////I ENJOYED MAKING THIS GAME AND I HOPE YOU ENJOY PLAYING IT TOO ^-^/////////
//////////////////////////////////////////////////////////////////////////////////

Ghost ghost;
CountDown timer;

////IMAGES////
PImage splashScreen;
PImage background;
PImage pop;
PImage gameOver;
PImage info;
PImage restart;
PImage howToPlay;

////GAME MODES////
final int SPLASH = 0;
final int PLAY = 1;
final int STOP = 2;
final int OVER = 3;

////GLOBAL VARIABLES////
private int score;
private int highScore;
public int spawnTimer = 0;
public int gameMode = SPLASH;
private int bgX= 0;

////ARRAYS LISTS////
ArrayList<Bubble> bubbleList = new ArrayList();
ArrayList<Obstacle> planeList = new ArrayList();
ArrayList<Obstacle> birdList = new ArrayList();

void setup() {
  size(1000, 700);
  score = 0;

  background = loadImage("bg.png");
  splashScreen = loadImage("splash.png");
  pop = loadImage("pop.png");
  gameOver = loadImage("gameover.png");
  info = loadImage("info.png");
  restart = loadImage("restart.png");
  howToPlay = loadImage("howtoplay.png");

  ghost = new Ghost(15, 305);
}

void draw() {

  //////////SPLASH SCREEN//////////
  if (gameMode == SPLASH) {

    image(background, bgX, 0);
    image(splashScreen, 125, 250);
    image(info, 600, 600);
    image(howToPlay, 210, 325);

    if (key == ' ') {
      gameMode = PLAY;
    }
  }

  //////////PLAYING//////////
  if (gameMode == PLAY) {

    drawBackground(); 
    ghost.render();
    scores();

    /////////SPAWN RATES/////////
    spawnTimer++;

    if (spawnTimer %60 == 0) {
      bubbleList.add(new Bubble(width+(int)random(100), height-(int)random(1000)) );
    }

    if (spawnTimer %600 == 0) {
      planeList.add(new Plane(width+(int)random(100), height-(int)random(1000)) );
    }

    if (spawnTimer %200 == 0) {
      birdList.add(new Bird(width+(int)random(10), height-(int)random(1000)) );
    }

    /////////COLLISIONS//////////
    for (int i = 0; i < bubbleList.size(); i++) {

      Bubble currentBubble = bubbleList.get(i);
      currentBubble.update();

      if (ghost.pop(currentBubble)) {
        score++;
        image(pop, currentBubble.x-32, currentBubble.y-58);
        bubbleList.remove(i);
      }
    }

    for (int i = 0; i < planeList.size(); i++) {

      Obstacle currentPlane = planeList.get(i);
      currentPlane.update();

      if (ghost.crash(currentPlane)) {
        gameMode = STOP;
      }
    }

    for (int i = 0; i < birdList.size(); i++) {

      Obstacle currentBird = birdList.get(i);
      currentBird.update();

      if (ghost.crash(currentBird) || ghost.kill(currentBird)) {
        gameMode = STOP;
      }
    }

    if (timer.getRemainingTime() < 1) {
      gameMode = OVER;
    }
  }

  //////////CRASHED//////////
  if (gameMode == STOP) {
    image(background, 0, 0);
    image(restart, 90, 300);
    image(gameOver, 230, 200);
    textAlign(CENTER);
    text("You scored: " + score + " point(s)", width/2, 70);
    if (score > highScore) {
      text("Congrats!! You scored the highest", width/2, 95);
    } else {
      text("Highest score is: " + highScore, width/2, 95);
    }

    if (key == ' ') {
      restart();
      gameMode = PLAY;
    }
  }

  /////////GAME OVER//////////
  if (gameMode == OVER) {

    image(background, 0, 0);
    image(gameOver, 230, 200);
    textAlign(CENTER);
    text("You scored: " + score + " point(s)", width/2, 70);
    if (score > highScore) {
      text("Congrats!! You scored the highest", width/2, 95);
    } else {
      text("Highest score is: " + highScore, width/2, 95);
    }
  }
}

void scores() { 
  //I couldn't figure out why the scores go left when the game is restarted
  timer = new CountDown(60);
  fill(255);
  textSize(30);
  text("Score: " + score, 5, 55);
  text("High score: " + highScore, 5, 80);
  text("Remaining time: " + timer.getRemainingTime(), 5, 30);
}

void restart() {
  ghost = new Ghost(15, 305);
  bubbleList = new ArrayList<Bubble>();
  planeList = new ArrayList<Obstacle>();
  birdList = new ArrayList<Obstacle>();

  if (score > highScore) {
    highScore = score;
  }
  score = 0;
  timer = new CountDown(60);
}

void drawBackground() {
  image(background, bgX, 0);
  image(background, bgX+background.width, 0);
  bgX -=4;
  if (bgX == -background.width)
    bgX=0;
}

//////////////MOVEMENT///////////////
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP && ghost.y > 5)
      ghost.y -= 10;
    else if (keyCode == DOWN && ghost.y < height-110)
      ghost.y += 10;
    else if (keyCode == RIGHT && ghost.x < width-95)
      ghost.x += 10;
    else if (keyCode == LEFT && ghost.x > 5)
      ghost.x -= 10;
  }
}
