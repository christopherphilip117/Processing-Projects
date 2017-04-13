//CREATURE01
//CHRISTOPHER PHILIP CP26645

float row;
float col;

float x = 400;
float y = 400;

float xEye;
float yEye;

void setup(){
size(800, 800);

}


void draw(){
 
//FOR LOOP THAT CONTROLS SPEED OF BACKGROUND CIRCLES
//AS WELL AS GRAYSCALE OR FULL COLOR
//BASED ON CURSOR POSITION
  
for (int i = 0; i < mouseX; i+=200){
 stroke(255);
row = random(800);
col = random(800);
float size = random(200);
strokeWeight(5);
if(mouseY < 400){
fill(random(255));
}
else{
fill(random(255),random(255),random(255));
}
ellipseMode(CENTER);
ellipse(row, col, size, size);
}

stroke(0);
//LEGS
float x1 = 350;
float y1 = 460;
float x2 = 300;
float y2 = 585;
float x3 = 400;
float y3 = 585;
fill(150);
triangle(x1,y1,x2,y2,x3,y3);
triangle(x1+100,y1,x2+100,y2,x3+100,y3);

//BODY
ellipseMode(CENTER);
fill(0);

ellipse(x, y, x-200, y-200);

//SMALLER BODY
ellipseMode(CENTER);
fill(random(255),random(255),random(255));
stroke(random(255),random(255),random(255));
ellipse(x,y,x-250,y-250);

//HEAD
rectMode(CENTER);
stroke(0);
fill(0);
rect(x,y-200,x-100,y-200);

//EYES
ellipseMode(CENTER);
fill(255);
xEye = 320;
yEye = 175;
ellipse(xEye,yEye,x-300,y-300);
ellipse(xEye+155,yEye,x-300,y-300);
fill(0);
ellipse(xEye,yEye,x-350,y-350);
ellipse(xEye+155,yEye,x-350,y-350);

//ARMS
strokeWeight(3);

float lineBase = 320;
float lineBase2 = 470;
line(lineBase,lineBase+25,lineBase-170,mouseY);
line(lineBase2,lineBase2-130,lineBase2+220,mouseX);

}