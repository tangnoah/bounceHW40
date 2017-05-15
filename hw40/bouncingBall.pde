class bouncingBall{
  float angle = random(6.28);
  float x = random(400);
  float y = random(600);
  int speed = int(random(1,4));
  int[] bcolor = {int( random(256) ), int( random(256) ), int( random(256) ) };
  boolean stopped = false;
  float size = 20;
  
  void move(){
     x += speed * cos(angle);
     y += speed * sin(angle);
     if( stopped)
       size += 0.2;
  }
  
  void display(){
    ellipse(x, y, int(size), int(size)); 
  }
  
  int[] getColor(){
    return bcolor; 
  }
  
  void reflect(){
    if( x < 5 || x > 395)
      angle = 3.14 - angle;
    if( y < 5 || y > 595)
      angle = 6.28 - angle;
  }
  
  void stopBall(){
     stopped = true;
     speed = 0;
  }
  
  boolean collision(ArrayList<bouncingBall> ballList){
     for( bouncingBall b: ballList){
       if( b != this && dist(x,y,b.x,b.y) <= (b.size)){
         return true;
       }
     }
     return false;
  }
  
  boolean collisionWithStopped(ArrayList<bouncingBall> ballList){
     for( bouncingBall b: ballList){
       if( b.stopped && b != this && dist(x,y,b.x,b.y) <= (int(b.size))){
         return true;
       }
     }
     return false;
  }
}