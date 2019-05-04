void setup()
{
  size(700,500);
  background(255);
  
}



void draw()
{
  float numBars=100;
  drawBars(numBars);
  
}

void drawBars(float n)
{
  float nBars=0;
  float barX=0;
  float barY=0;
  float barW=10;
  fill(0);
  rect(barX,barX,barW,height);
  while (nBars<=n)
  {
    if (nBars%2==0)
    {
      
      fill(0);
      rect(barX,barY,barW,height);
    }
    else
    {
      fill(255);
      rect(barX,barY,barW,height);
    }
    barX+=10;
    nBars++;
  }
}
