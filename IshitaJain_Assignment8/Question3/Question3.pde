//array for face
Face[][] faces; 
//number of faces in each row and coloumn
int cols = 10;
int rows = 10;
//setup
void setup() {
  size(500, 500);
  faces = new Face[cols][rows];

//putting it in a loop
  for (int i = 0; i < cols; i ++ ) {
    for (int j = 0; j < rows; j ++ ) {
      // Initialize each object
      faces[i][j] = new Face(i*20, j*20, 20, 30, i+j);
    }
  }
}
//draw the faces
void draw() {
  background(0);
  for (int i = 0; i < cols; i ++ ) {     
    for (int j = 0; j < rows; j ++ ) {

      faces[i][j].display();
    }
  }
}



// A Face object
//declare class for face
class Face {


  float x, y;   // x,y location
  float w, h;   // width and height
  float angle; // angle for oscillating brightness

  // Face Constructor
  Face(float tempX, float tempY, float tempW, float tempH, float tempAngle) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    angle = tempAngle;
  }
//display the face
//happiness level is donated with the red colour.
  void display() {
    int happy=int(x);
    noStroke();
    fill(random(255), 0, 0);
    ellipse(3*x, 3*y, 2*w, h);
    fill(0);
    ellipse(3*x-3, 3*y-3, w/2, h/2);
    ellipse(3*x+5, 3*y-3, w/2, h/2);
    noLoop();
  }
}

