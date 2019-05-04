
//circle radius
int circleR=20;

void setup()
{
  size(500,500);
  
}

void draw()
{
  //the four squares on the four corners
  fill(0,0,255);
  noStroke();
  ellipse(random(0,200),random(0,200),circleR,circleR);
  ellipse(random(300,500),random(0,200),circleR,circleR);
  ellipse(random(0,200),random(300,500),circleR,circleR);
  ellipse(random(300,500),random(300,500),circleR,circleR);
  //making the cross
  fill(0,255,0);
  ellipse(random(width),random(200,300),circleR,circleR);
  ellipse(random(200,300),random(height),circleR,circleR);
  
}


