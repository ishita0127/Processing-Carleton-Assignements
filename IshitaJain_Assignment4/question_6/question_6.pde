PFont f;
PFont g; 
float x=700/2;
float y=0;
int a;
int b;
float speed = 0;
float gravity=0.2;


color pink=color (255, 108, 170) ;
color peach=color (255, 192, 108);
color brown=color (196, 154, 71);
color black=color(0, 0, 0);
color red=color(255,0,0);

void setup()
{
  size(700, 700);
  f= createFont("Arial", 30, true);
  g= createFont("Arial", 15, true);
}

void draw()
{

  background(255);
  //wall
  fill(0, 160, 0);
  rect(0, 0, width, 500);
  //floor
  fill(142, 107, 36);
  rect(0, 500, width, 200);

  //girl dress
  fill(pink);
  triangle(200, 500, 150, 600, 250, 600);
  rect(150, 600, 10, 10);
  rect(160, 600, 10, 10);
  rect(170, 600, 10, 10);
  rect(180, 600, 10, 10);
  rect(190, 600, 10, 10);
  rect(200, 600, 10, 10);
  rect(210, 600, 10, 10);
  rect(220, 600, 10, 10);
  rect(230, 600, 10, 10);
  rect(240, 600, 10, 10);


  //wall shelf
  fill(brown);
  rect(400, 300, 200, 100);
  //shelf line
  fill(0);
  stroke(0);
  strokeWeight(15);
  line(400, 400, 600, 400);

  //books on the shelf
  strokeWeight(2);
  fill(pink);
  rect(400, 350, 20, 50);
  fill(255, 0, 0);
  rect(425, 350, 20, 50);
  fill(0, 255, 0);
  rect(450, 350, 20, 50);
  fill(0, 0, 255);
  rect(475, 350, 20, 50);
  fill(255, 130, 180);
  rect(500, 350, 20, 50);
  fill(pink);
  rect(525, 350, 20, 50);
  fill(255, 0, 0);
  rect(550, 350, 20, 50);
  fill(0, 255, 0);
  rect(575, 350, 20, 50);

  //table
  fill(brown);
  rect(400, 500, 150, 100);
  rect(440, 600, 10, 20);
  rect(410, 600, 10, 30);
  rect(500, 600, 10, 20);
  rect(530, 600, 10, 30);

  //Confusion Created when exams are near.
  frameRate(10);
  textFont(f);
  fill(0, 0, 255);
  textAlign(CENTER);
  text("1+20000/34567", random(width), random(height));
  text("computerscience", random(width), random(height));

  //i feel sick and then i feel angry
  //mood swings
  if (mousePressed && (mouseButton == LEFT)) {
    fill(0, 255, 0);
  } else if (mousePressed && (mouseButton == RIGHT)) {
    //keep clicking th emocuse right and the color will change from
    //red to pink to purple etc.
    fill(red);
    red=red+5;
  } else {
    fill(peach);
  }
  ellipse(200, 500, 50, 50);
  rect(175, 610, 10, 30);
  rect(210, 610, 10, 30);

  //eyes
  fill(0);
  ellipse(190, 500, 5, 5);
  ellipse(210, 500, 5, 5);

  //poker face
  stroke(0);
  strokeWeight(2);
  line(190, 510, 210, 510);

  frameRate(30);
  fill(255);
  rect(x, y, 30, 50);
  rect(x-30, y, 30, 50);
  fill(0);
  textFont(g);
  text("a,b,c,d", x, y+20);  
  text("hello", x, y+40);

  y=y+speed;

  speed=speed+gravity;

  if (y>height) {

    speed=speed*-.95;
  }
}

void mousePressed()

{
  //whatever emotion we have sick or angery hert tends 
  //to beat really fast and it seems the 
  //whole world is also beating like a heart beat
  noStroke();
  fill(255, 0, 0);
  ellipse(210, 550, 10, 20);
  
 
  
}







