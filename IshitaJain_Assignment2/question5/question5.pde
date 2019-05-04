float x;
float y;
final color blankScreenColor=color(255);


void setup(){
  size(500,500);
  background(blankScreenColor);
}


void draw(){
  x=random(width);
  y=random(height);
}

void mousePressed(){
  fill(255,0,0);
  ellipse(x,y,20,20);

switch(key)
    {
  case 'r':
        noStroke();
        fill(0,255,0);
        rect(x,y,20,80);
        fill(90,80,0);
        rect(x,y,30,30);
  break;
  
  case 'b':
        fill(90,80,200);
        ellipse(x,y,20,30);
        ellipse(x,y,30,20);
  break;
  
  case'g':
        noStroke();
        fill(230,30,60);
        ellipse(x,y,40,50);
        fill(255,60,90);
        rect(x,y,70,30);
        fill(0,20,70);
        rect(x,y,40,50);
  break;
 
}
}
