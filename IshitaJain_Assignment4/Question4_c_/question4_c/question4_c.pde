color green = color(0, 150, 0);
color blue = color(0, 0, 150);

void setup() {
  size(480, 480);
  noStroke();
  smooth();
}

void draw() {
  int x = int(random(0, 480));
  int y = int(random(0, 480));

  int cx = x - 240;  
  int cy = y - 240;

//
  
  if ( (cy - 2*cx > -240) && (cy + 2*cx > -240 )) {
    fill(green);
    ellipse(x, y, 20, 20);
  } else {
    fill(blue);
    ellipse(x, y, 20, 20);
  }
}

