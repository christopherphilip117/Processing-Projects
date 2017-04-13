
otherMonster xy;
otherMonster zy;

void setup(){
  size(800, 800);
  
  xy = new otherMonster(random(50,300), random(0,800), random(0,800));
  zy = new otherMonster(random(50,300), random(0,800), random(0,800));
}

void draw(){
  background(255);
  xy.make();
  zy.make();
  //mo.make();
  xy.move();
  zy.move();
  if(xy.x == zy.x){
    xy.collision();
    zy.collision();
  }
  
}


class otherMonster{
  float x;
  float y;
  float size;
  float incx = random(20);
  float incy = random(20);
  color c1;

  otherMonster(float tempSize, float temp1, float temp2){
    x = temp1;
    y = temp2;
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

    if((x + incx > 0) && (x + incx < 800))
      x += incx;
      else{
      incx *= -1;
      x += incx;
      ellipseMode(CENTER);
      fill(c1);
      ellipse(x, y, size, size);
      //split();
      }
      
    if((y + incy > 0) && (y + incy < 800))
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
    incy*=-1;
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