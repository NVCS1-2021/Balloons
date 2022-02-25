public class Chaser {
  public PVector pos, vel, acc;
  public int SIZE = 20;
  public float MAX_SPEED = 7;

  public Chaser() {
    pos = new PVector(width, height).mult(0.5);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  public void move() {
    vel.add(acc);
    pos.add(vel);

    if (this.pos.x < 0 || this.pos.x > width) {
      this.pos = new PVector (width/2, height/2);
    }
    if (this.pos.y < 0 || this.pos.y > height) {
      this.pos = new PVector (width/2, height/2);
    }
  }
  public void collide(Balloon b) {
    if (dist(this.pos.x, this.pos.y, b.pos.x, b.pos.y) < 10) {
      b.active = false;
    }
  }

  public void chase(ArrayList<Balloon>  bs) {
    Balloon targetBalloon = target(bs);

    PVector perfectVel = PVector
      .sub(targetBalloon.pos, pos)
      .limit(MAX_SPEED);
    acc = PVector
      .sub(perfectVel, vel)
      .limit(MAX_SPEED * 5);
  }


  private Balloon target(ArrayList<Balloon> balloons) {
    try {
      Balloon closestBalloon = balloons.get(0);
      for (int i = 0; i < balloons.size(); i++) {
        if (dist(balloons.get(i).pos.x, balloons.get(i).pos.y, this.pos.x, this.pos.y) < dist(closestBalloon.pos.x, closestBalloon.pos.y, this.pos.x, this.pos.y)) {
          closestBalloon = balloons.get(i);
        }
      }
      return closestBalloon;
    }
    catch(Exception e) {
      return new Balloon();
    }
  }
  private Balloon targetBiggest(ArrayList<Balloon> balloons) {
    Balloon biggestBalloon = balloons.get(0);
    for (int i = 0; i < balloons.size(); i++) {
      if (balloons.get(i).size > biggestBalloon.size) {
        biggestBalloon = balloons.get(i);
      }
    }
    return biggestBalloon;
  }

  public void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(PVector.angleBetween(vel, new PVector(0, -1)));
    fill(255);
    circle(0, 0, SIZE);
    fill(0);
    circle(0, -SIZE/3, SIZE/3);
    popMatrix();
  }
}
