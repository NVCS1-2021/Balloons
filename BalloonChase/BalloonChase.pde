Chaser chaser;
Balloon[] balloons = new Balloon[20];

public void setup() {
  size(600,600);
  chaser = new Chaser();
  spawnBalloons();
}

public void draw() {
  background(220);
  showBalloons();
  chaser.draw();
  chaser.chase(balloons);
  chaser.move();
}

private void showBalloons() {
  for (int i = 0; i < balloons.length; i++){
    balloons[i].draw();
  }
}
private void spawnBalloons() {
 for (int i=0; i < balloons.length; i++) 
   balloons[i] = new Balloon();
}
