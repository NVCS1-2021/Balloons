Chaser chaser;
Balloon balloons[] = new Balloon[50];

public void setup() {
  size(600,600);
  chaser = new Chaser();
  spawnBalloons();
}

public void draw() {
  background(220);
  chaser.chase(balloons);
  chaser.move();
  chaser.draw();
  for(int i = 0; i < balloons.length; i++) {
    balloons[i].draw(); //<>//
 // balloons[i].move();
  }
}

public void spawnBalloons() {
  for(int i = 0; i < balloons.length; i++) {
   balloons[i] = new Balloon();
  }
}
