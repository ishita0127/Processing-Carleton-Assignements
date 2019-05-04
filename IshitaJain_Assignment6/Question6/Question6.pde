int [] randomData= {
  100, 
  90, 
  213, 
  35, 
  10, 
  300, 
  250, 
  234, 
  568, 
  20, 
  600, 
  600, 
  40, 
  200, 
  70, 
  10, 
  345, 
  203, 
  305, 
  413,
};

//size of the working window
void setup()
{
  size(700, 700);
}

// Main draw loop
void draw() {

  int x=0;
  for (int i=0; i<20; i++) {
    if(mouseX>x&&mouseX<=x+30)
    {
      fill(255,0,0);
    }
    else
    {
      fill(0);
    }

    //we need to make the data range fit in out window so we can use map
    // we take the upper bound as a little larger our biggest value
    // and the lower bound as a little lower than our lowest value
    float h = map (randomData[i], 500, 250, 10, 400);
    noStroke();
    // as y increaces pf our box is to make it look like they grow from bottom to top
    rect(x+10, height-h, 20, h);
    
    // after we have drawn a bar we need to incriment our x position so
    // they don't draw on top of each other
    x+=30;
  }
} //end main draw()


