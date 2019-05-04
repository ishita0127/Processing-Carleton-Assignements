final color blankScreenColor=color(0,255,0);


//Goldilocks Head
int gHeadX=50;
int goldilocksHeadX=300;
int goldilocksHeadY=95;

void drawBear(int x, int y, int diam)
{
  fill(121,89,20);
  int headDiam = diam/2;
  int earDiam = diam/4;
  int headY = y - (diam*3/4);
  int earX1 = x - (diam/6);
  int earX2 = x + (diam/6);
  int earY = headY - earDiam; 
  ellipse(x,headY,headDiam, headDiam);//head
  ellipse(x,y,diam,diam);//body
  ellipse(earX1,earY,earDiam,earDiam);//ear1
  ellipse(earX2,earY,earDiam,earDiam);//ear2
}




void setup(){
  size(600,600);
  background(blankScreenColor);
  
}
 
 void draw(){
   drawBear(110,450,160);
   drawBear(300,450,160);
   drawBear(490,450,160);
   
   fill(255,0,166);
   triangle(250,200,350,200,300,100);
   fill(255);
   ellipse(goldilocksHeadX,goldilocksHeadY,gHeadX,gHeadX);
 }




  
  
