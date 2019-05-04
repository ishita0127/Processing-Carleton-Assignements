Tree tree;
//creating a class with a constructor 
class Tree
{
  float xpos;
  float ypos;

  color col;

  float treeHeight;

  float trunkWidth;
  float trunkHeight;

  float leafWidth;
  float leafHeight;

  int size;

  final float[] treeSizes =
  {
    10, 
    20, 
    30, 
    40, 
    50, 
    60, 
    70, 
    80, 
    90, 
    100,
  };

  final color[] colors =
  {
    color(20, 77, 12), 
    color(85, 1, 6), 
    color(250, 99, 5),
  };

  Tree(float x, float y)
  {
    xpos = x;
    ypos = y;

    col = colors[(int)(random(0, colors.length))];

    treeHeight = treeSizes[(int)(random(0, treeSizes.length))];

    trunkWidth = random(width/150, width/19);
    trunkHeight = random(height/13, height*2/9);

    leafWidth = width/11;
    leafHeight = height/11;
  }

  void draw()
  {
    rectMode(CENTER);
    fill(108, 69, 42);
    rect(xpos, ypos + height/2, 
    trunkWidth, treeHeight, 
    2, 2, 2, 2);
  }

  void Trees()
  {
    fill(0);
    rect(width/3, height/3, 30, 100);
  }
}
//basic setup function
void setup()
{
  size(500, 400);
  background(255);
  selectionSort(10, 1);
}

void draw() {
}

//fuction for sorting the trees according to the sizes and shapes
void selectionSort(int m, int n)
{
  int trunkWidth = width/16;
  int trunkHeight = height/12;

  int spaceBetweenW = width/26;
  int spaceBetweenH = height/26;

  int nCounter = 0;
  while (nCounter < n)
  {
    int mCounter = 0;
    while (mCounter < m)
    {
      Tree newTree =
        new Tree(mCounter * trunkWidth + (mCounter+1) * spaceBetweenW + width/83, 
      nCounter * trunkHeight + (nCounter+1) * spaceBetweenH);

      newTree.draw();

      mCounter++;
    }
    nCounter++;
  }
}
//function which take in no parameters
void Tree()
{
}

