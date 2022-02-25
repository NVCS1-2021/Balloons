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
    //2.a.1 variable for answer
    Balloon bigBalloon = balloons[0];
    //2.a.2 variable for size
    
    //2.b. traverse array with for loop
    
      //2.c. if statement to maybe change variables
      
    //2.d. return answer  
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
