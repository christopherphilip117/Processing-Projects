//CREATURE01
//CHRISTOPHER PHILIP CP26645

float x;
float y;
void setup(){
  
size(800, 800);
//background(255,255,255); 
}
void draw(){
  
//background(255,255,255);

x = random(height);
y = random(height);
fill(random(255),random(255),random(255));
strokeWeight(5);
stroke(random(255),random(255),random(255));
ellipseMode(CENTER);
ellipse(x, y, x, x);


//LEGS
stroke(0);
fill(150);
triangle(350,460,300,585,400,585);
triangle(450,460,400,585,500,585);

//BODY
ellipseMode(CENTER);
fill(0);

ellipse(400,400,200,200);

//SMALLER BODY
ellipseMode(CENTER);
fill(random(255),random(255),random(255));
stroke(random(255),random(255),random(255));
ellipse(400,400,150,150);

//HEAD
rectMode(CENTER);
stroke(0);
fill(0);
rect(400,200,300,200);

//EYES
ellipseMode(CENTER);
fill(255);
ellipse(320,175,100,100);
ellipse(475,175,100,100);
fill(0);
ellipse(320,175,50,50);
ellipse(475,175,50,50);

//ARMS
strokeWeight(3);
//line(320,345,150,mouseY);
//line(470,340,690,mouseX);

line(320,345,150,500);
line(470,340,690,500);





}