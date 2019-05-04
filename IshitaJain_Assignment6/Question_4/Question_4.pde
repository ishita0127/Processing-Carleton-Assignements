void setup()
{
  size(500, 500);
  background(255);
  noStroke();
  fill(255, 0, 0);
  rectMode(CENTER);
  rect(width/2, height/2, 200, 440);
  smooth();
}

void draw()
{

  int nStorey=0;
  int x1=150;
  int x2=350;
  int y=60;
  //for drawing 20 storeys in the building
  while (nStorey<20)
  {
    stroke(0);
    strokeWeight(2);
    line(x1, y, x2, y);
    nStorey++;
    y+=20;
  }
  int nWindows=0;
  int windowX=170;
  int windowY1=60;
  int windowY2=440;
  //10 window on each floor
  while (nWindows<10)

  {
    stroke(0);
    strokeWeight(2);
    line(windowX, windowY1, windowX, windowY2);
    nWindows++;
    windowX+=20;
  }
}

