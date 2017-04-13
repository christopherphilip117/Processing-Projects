import processing.sound.*;
SoundFile file1;
SoundFile file2;
otherMonster xy;
otherMonster zy;

PFont f; 
PFont f2; 
String s1; 
String s2; 
String s3; 

barrier b1;
barrier b2;
barrier b3;
barrier b4;
barrier b5;


void setup(){
 
  size(1280, 800);
  frameRate(30);
  file1 = new SoundFile(this, "bumper.mp3");
  file2 = new SoundFile(this, "Death Spike.mp3");
  
   f = createFont("Helvetica",100);
   f2 = createFont("HelveticaNeue-Italic", 100);
   
   s1 = "Velocity";
   s2 = "created by";
   s3 = "Christopher Philip";
  
  xy = new otherMonster(random(50,100), random(0, width), random(0, height));
  zy = new otherMonster(random(50,100), random(0, width), random(0, height));
  b1 = new barrier(random(50,300), random(0, width), random(0, height));
  b2 = new barrier(random(50,300), random(0, width), random(0, height));
  b3 = new barrier(random(50,300), random(0, width), random(0, height));
  b4 = new barrier(random(50,300), random(0, width), random(0, height));
  b5 = new barrier(random(50,300), random(0, width), random(0, height));
}
 

void draw(){
  background(175);
  if(frameCount <= (5*30)){
    background(0);
    fill(255);
    textAlign(CENTER);
    
    textFont(f2,90);
    text(s1, width/2, 280);
    
    textFont(f,90);
    text(s2, width/2, 400);
    
    textFont(f,90);
    text(s3, width/2, 520);
  }
  else{
    
  xy.make();
  zy.make();
  b1.make();
  b2.make();
  b3.make();
  b4.make();
  b5.make();
  xy.move();
  zy.move();
  
 float d = dist(xy.x, xy.y, zy.x, zy.y);
 if(d < xy.r + zy.r){
   file2.play();
   xy.collision();
   zy.collision();
 }
 
 evolve(xy, b1);
 evolve(zy, b1);
 evolve(xy, b2);
 evolve(zy, b2);
 evolve(xy, b3);
 evolve(zy, b3);
 evolve(xy, b4);
 evolve(zy, b4);
 evolve(xy, b5);
 evolve(zy, b5);
 //float e = dist(xy.x, xy.y, b1.x, b1.y);
 //if(e < xy.r + b1.r){
 //  xy.collision();
 //  b1.grow();
 //  evolve(xy,b1);
 //}
 
 //float f = dist(zy.x, zy.y, b1.x, b1.y);
 //if(f < zy.r + b1.r){
 //  zy.collision();
 //  b1.grow();
 //}
 
 //float g = dist(xy.x, xy.y, b2.x, b2.y);
 //if(g < xy.r + b2.r){
 //  xy.collision();
 //  b2.grow();
 //}
 
 //float h = dist(zy.x, zy.y, b2.x, b2.y);
 //if(h < zy.r + b2.r){
 //  zy.collision();
 //  b2.grow();
 //}
 
 //float i = dist(b1.x, b1.y, b2.x, b2.y);
 //if(i < b1.r + b2.r){
 //  b1.reset();
 //  b2.reset();
 //}
 check(b1, b2);
 check(b1, b3);
 check(b1, b4);
 check(b1, b5);
 check(b2, b3);
 check(b2, b4);
 check(b2, b5);
 check(b3, b4);
 check(b3, b5);
 check(b4, b5);
 
 
  }
  }
  
void check(barrier x1, barrier x2){
 float i = dist(x1.x, x1.y, x2.x, x2.y);
 if(i < x1.r + x2.r){
   x1.reset();
   x2.reset();
 }
}
void evolve(otherMonster m, barrier temp){
 float e = dist(m.x, m.y, temp.x, temp.y);
 if(e < m.r + temp.r){
   m.collision();
   temp.grow();
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
  file1.play();
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

    if((x + incx > 0) && (x + incx < width))
      x += incx;
      else{
      incx *= -1;
      x += incx;
      ellipseMode(CENTER);
      fill(c1);
      ellipse(x, y, size, size);
      //split();
      }
      
    if((y + incy > 0) && (y + incy < height))
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