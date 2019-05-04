void setup()
{
  size(800,900);
  background(255);
}


void draw()
{
  int i = 0;

  while (i <= 500) {
    float grassX=random(float(5), float(width-10));
    float grassY=random(float(height/2), float(height-10));

    Grass(grassX, grassY);

    i++;
  } 

  noLoop();
  int dogX = width/2;
  int dogY = height/3;
  
  drawDog(dogX, dogY);
}

void drawDog(int x, int y)
{
  //dog head
  int headX = 100;
  
  int diameter = 50;
  
  int bodyW= 250;
  int bodyH= 150;
  noStroke();
  
  //body
  fill(224,180,91);
 rectMode(CENTER);
 rect(x, y, bodyW,bodyH);
 //head
 rect(width/3,bodyW-diameter,headX,headX);
 //tail
 fill(180,141,62);
 ellipse(x+bodyW/2+diameter/4,y-bodyH/2-diameter/4, diameter, diameter);
 //legs
 stroke(0);
 rectMode(CORNER);
 rect(x-bodyW/2,y+bodyH/2,diameter,diameter);
 rect(x-bodyW/2+diameter,y+bodyH/2,diameter,diameter);
 rect(x-bodyW/2+3*diameter,y+bodyH/2,diameter,diameter);
 rect(x-bodyW/2+4*diameter,y+bodyH/2,diameter,diameter);
 //ears
 noStroke();
 ellipse(width/3+diameter,bodyW-2*diameter,diameter+15,diameter+15);
 //mouth
 rect(width/3-75,bodyW-diameter,50,50);
 //nose
 fill(0);
 ellipse(width/3-75,bodyW-diameter,20,20);
 //eye
 fill(0);
 stroke(0);
 ellipse(width/3-20,bodyW-75,10,10);
}
  
  
void Grass(float x, float y)
{
  stroke(0, 255, 0);
  strokeWeight(2);
  line(x, y, x, y+30);
}

