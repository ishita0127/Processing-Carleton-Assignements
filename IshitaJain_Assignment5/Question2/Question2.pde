PFont f;

void setup()
{
  size(950,500);
  background(255);
  f=createFont("Arial",30,true);
  
}

int i=0;
int numberX=20;
int numberY=30;

void draw()
{
  while(i<=25)
  {
    if (i%2==0)
    {
      fill(0,0,255);
      text(i, numberX,numberY);
    }
    else 
    {
      fill(255,0,0);
      text(i,numberX,numberY);
    }
    
    if (i<=10)
    {
      numberX += 30;
    }
    else
    {
      numberX +=40;
    }
    
    i++;
  }
}
     
