void setup()

{
  size(800,900);
  background(255);
}

void draw()
{
  int nDog=0;
 while (nDog<=15)
 {
   
   int X= int(random(width));
   int Y= int(random(height));
   
   drawDog(X,Y);
   nDog++;
   
 }
 println(nDog);
 noLoop();
 
 
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
  








