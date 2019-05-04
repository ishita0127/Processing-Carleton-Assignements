int centerX;
int centerY;

void setup()
{
  size(500,500);
  centerX=width/2;
  centerY=height/2;
  noStroke();
}

void draw()
{
  noStroke();
  frameRate(100);
  float x=random(0,width);
  float y=random(0,width);
  //used dist() function for making a circle in the center
  if (dist(centerX,centerY,x,y) < height/6 && dist(centerX,centerY,x,y) < height/3)
  {
    noStroke();
    fill(0,255,0);
    ellipse(x,y,20,20);
  }
  
  //used dist() for making the ring around the circle drawn above
  if(dist(centerX,centerY,x,y) > height/6 && dist(centerX,centerY,x,y) < height/3)
  {
    noStroke();
    fill(255,0,0);
    ellipse(x,y,20,20);
  }
  else 
  {
    noStroke();
    fill(0,255,0);
    ellipse(x,y,20,20);
  }
 
}

