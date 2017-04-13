
otherMonster xy;
otherMonster zy;

barrier b1;
barrier b2;

void setup(){
  size(700, 700);
  
  xy = new otherMonster(random(50,100), random(0,700), random(0,700));
  zy = new otherMonster(random(50,100), random(0,700), random(0,700));
  b1 = new barrier(random(50,100), random(0, 700), random(0,700));
  b2 = new barrier(random(50,100), random(0, 700), random(0,700));
}

void draw(){
  background(255);
  xy.make();
  zy.make();
  b1.make();
  b2.make();
  xy.move();
  zy.move();
  
 float d = dist(xy.x, xy.y, zy.x, zy.y);
 if(d < xy.r + zy.r){
   xy.collision();
   zy.collision();
 }
 
 float e = dist(xy.x, xy.y, b1.x, b1.y);
 if(e < xy.r + b1.r){
   xy.collision();
   b1.grow();
 }
 
 float f = dist(zy.x, zy.y, b1.x, b1.y);
 if(f < zy.r + b1.r){
   zy.collision();
   b1.grow();
 }
 
 float g = dist(xy.x, xy.y, b2.x, b2.y);
 if(g < xy.r + b2.r){
   xy.collision();
   b2.grow();
 }
 
 float h = dist(zy.x, zy.y, b2.x, b2.y);
 if(h < zy.r + b2.r){
   zy.collision();
   b2.grow();
 }
 
 float i = dist(b1.x, b1.y, b2.x, b2.y);
 if(i < b1.r + b2.r){
   b1.reset();
   b2.reset();
 }
 
 
  }

  

class barrier{
float x;
float y;
float r;
float size;
color c1 = 255;
float orig;

barrier(float tempSize, float xTemp, float yTemp){
  x = xTemp;
  y = yTemp;
  r = tempSize/2;
  size = tempSize;
  orig = tempSize;
}

void make(){
  ellipseMode(CENTER);
  fill(c1);
  ellipse(x, y, size, size);
}

void grow(){
  size += 5;
  r = size/2;
  c1 = color(random(255), random(255), random(255));
}

void reset(){
  x = random(10,700);
  y = random(10,700);
  size = orig;
  r = size/2;
  make();
}


}



class otherMonster{
  float x;
  float y;
  float r;
  float size;
  float incx = random(20);
  float incy = random(20);
  color c1;

  otherMonster(float tempSize, float temp1, float temp2){
    x = temp1;
    y = temp2;
    r = tempSize/2; 
    size = tempSize;
    c1 = color(random(255),random(255),random(255));
    
  }
  
  void make(){
    ellipseMode(CENTER);
    fill(c1);
    ellipse(x, y, size, size);
    fill(255);
    ellipse(x, y, 50, 50);
    fill(0);
    ellipse(x, y, 30, 30);
  }
  
  void move(){

    if((x + incx > 0) && (x + incx < 700))
      x += incx;
      else{
      incx *= -1;
      x += incx;
      ellipseMode(CENTER);
      fill(c1);
      ellipse(x, y, size, size);
      //split();
      }
      
    if((y + incy > 0) && (y + incy < 700))
      y += incy;
      else{
      incy *= -1;
      y += incy;
      ellipseMode(CENTER);
      fill(c1);
      ellipse(x, y, size, size);
      //split();
      }
 
  }
  
  void collision(){
    incx*=-1;
    x+=incx;
    incy*=-1;
    y+=incy;
  }
  
  
  //When object hits edge, split into two objects
  //void split(){
  //  ellipseMode(CENTER);
  //  fill(c1);
  //  ellipse(x, y, size, size);
  //  fill(255);
  //  ellipse(x, y, 50, 50);
  //  fill(0);
  //  ellipse(x, y, 30, 30);
  //}
  
  
  
  
  
  
}