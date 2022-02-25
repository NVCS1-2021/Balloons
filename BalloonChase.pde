Chaser chaser;
ArrayList<Balloon> balloons = new ArrayList();
public void setup() {
  size(600, 600);
  chaser = new Chaser();
  balloons.add(new Balloon());
}

public void draw() {
  background(220);
  if ((frameCount-1)%200 == 0) {
    spawnBalloons();
  }
  chaser.move();
  chaser.chase(balloons);
  chaser.draw();
  showBalloons();
}

public void spawnBalloons() {
  balloons.add(new Balloon());
  for (int i = 0; i < 50; i++) {
    balloons.add(new Balloon());
  }
}

public void showBalloons() {
  for (Balloon b : balloons) {
    b.show();
    b.move();
    b.outOfBounds();
    chaser.collide(b);
  }
  for (int i = balloons.size() -1; i >= 0; i--) {
    if (balloons.get(i).active == false) {
      balloons.remove(balloons.get(i));
    }
  }
}
