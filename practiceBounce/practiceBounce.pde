
float circleX = 10;
float xSpeed = 10;

float circleY = 0;
float ySpeed = 2;

float size = 32;
float sizeChange = 0.5;

void setup(){
  size(640,360);
}

void draw(){
  background(51);
  stroke(255);
  ellipse(circleX,circleY,size,size);
  circleX = circleX+ + xSpeed;
  size += sizeChange;
  
  if(circleX > width - size/2 || circleX < size/2){
    xSpeed *= -0.9;
    sizeChange *= -1;
    fill(random(255),random(255),random(255));
  }
  
  circleY = circleY + ySpeed;
  
   if(circleY > height - size/2 || circleY < 0){
    ySpeed *= -1;
    sizeChange *= -1;
    fill(random(255),random(255),random(255));
  }
  
}