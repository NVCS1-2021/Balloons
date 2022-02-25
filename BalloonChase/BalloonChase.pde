//1. spawn 50 balloons
Chaser chaser;
//1.a. create balloons array


public void setup() {
  size(600,600);
  chaser = new Chaser();
  //1.b. call spawnBalloons
  
}

public void draw() {
  background(220);
  //1.d. loop through balloons to draw, move all
  
  chaser.move();
  chaser.draw();
  //2.e. call chase method
  chaser.chase(balloons);
}

public void spawnBalloons() {
  //1.c. fill balloons array with balloons
  
}
