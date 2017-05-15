ArrayList<bouncingBall> ballList = new ArrayList<bouncingBall>();
boolean collecting = false;
boolean initial = true;

void setup() {
  size(400, 600);
  background(51);
  for( int i = 0; i < random(12, 20); i++){
    ballList.add(new bouncingBall()); 
  }
}

void draw() {
  clear();
  background(51);
  for( bouncingBall b: ballList){
    fill(b.getColor()[0], b.getColor()[1], b.getColor()[2]);
    b.move();
    b.display();
    b.reflect();
    if( initial && collecting 
      && b.collision(ballList)){
      b.stopBall();
      initial = false;  
    }
    else if( collecting && b.collisionWithStopped(ballList))
      b.stopBall();
  }
}

void mouseClicked(){
  collecting = true; 
}