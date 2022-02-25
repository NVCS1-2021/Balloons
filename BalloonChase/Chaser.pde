public class Chaser {
  public PVector pos, vel, acc;
  public int SIZE = 20;
  public float MAX_SPEED = 5;
  
  public Chaser() {
    pos = new PVector(width,height).mult(0.5);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  public void move() {
    vel.add(acc);
    pos.add(vel); 
  }
  
  public void chase(Balloon[] bs) {
    Balloon targetBalloon = target(bs);
    PVector perfectVel = PVector
      .sub(targetBalloon.pos,pos)
      .limit(MAX_SPEED);
    acc = PVector
      .sub(perfectVel,vel)
      .limit(MAX_SPEED * 0.1);
  }
  
  private Balloon target(Balloon[] balloons) {
    
    return balloons[0];
  }
  
  public void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(PVector.angleBetween(vel,new PVector(0,-1)));
    fill(255);
    circle(0,0,SIZE);
    fill(0);
    circle(0,-SIZE/3,SIZE/3);
    popMatrix();
  }
}
