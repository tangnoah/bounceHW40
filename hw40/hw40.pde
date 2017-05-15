ArrayList<bouncingBall> ballList = new ArrayList<bouncingBall>();
boolean collecting = false;

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
    if( collecting 
      && b.x < 250 && b.x > 150 
      && b.y < 350 && b.y > 250)
      b.stopBall();
  }
}

void mouseClicked(){
  collecting = true; 
}