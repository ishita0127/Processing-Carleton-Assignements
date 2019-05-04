float x=250;
float y=0;

float speed = 0;
float gravity=0.2;

void setup() {
  size(500, 500);
}

void draw() {


  background(0);
  fill(random(255), random(255), random(255));
  ellipseMode(CENTER);
  ellipse(x, y, 100, 100);

  y=y+speed;

  speed=speed+gravity;

  if (y>height) {

    speed=speed*-.95;
  }
}


