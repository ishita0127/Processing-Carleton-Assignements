

Tree r1;
//array for the different seasons and there color
color[] seasons = {
  color(0, 255, 0), color(255, 0, 0), 
  color(203, 90, 27)
};
//setup
void setup()
{
  size(640, 360);
  fill(255, 204);
  noStroke();
  //tree 
  r1 = new Tree(50, 10, 0.532, 0.5*height, 10, 30);
}
//draw
void draw()
{
  background(0);
  frameRate(1);
  r1.display();
}

class Tree 
{
  //Initializing the variables for the tree
  int Trunkw; // single bar width
  float xpos; // trunk xposition
  float h; // trunk height
  float ypos ; // rect yposition
  float d; // single trunk distance
  float t; // number of trunks
  Tree(int iw, float ixp, float ih, float iyp, float id, float it) {
    Trunkw = iw;
    xpos = ixp;
    h = ih;
    ypos = iyp;
    d = id;
    t = 5;
  }

//display the trees
  void display() {
    for (int i=0; i<t; i++) {
      fill(126, 70, 0);
      rect(xpos+(i*(6*d+Trunkw)), ypos, Trunkw, height*h);
//for random color apearing to show the seasons change
      color Seasons=seasons[(int) random(seasons.length)];
      fill(Seasons);
      ellipse(xpos+(i*(6*d+Trunkw)+20), ypos, 2*Trunkw, 2*Trunkw);
    }
  }
}

