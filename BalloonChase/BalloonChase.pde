Balloon[] balloons = new Balloon[50];
Chaser chaser;

public void setup() {
  size(600, 600);
  chaser = new Chaser();
  spawnBalloons();
}
  public void draw() {
    background(220);
    for (int i = 0; i < balloons.length; i++) {
      balloons[i].draw();
      balloons[i].move();
      chaser.move();
      chaser.draw();
      chaser.chase(balloons);
      
    }
  }

  public void spawnBalloons() {
    for (int i = 0; i < balloons.length; i++) {
      balloons[i] = new Balloon();
    }
  }
