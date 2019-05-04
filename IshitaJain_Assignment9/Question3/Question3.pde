
  float survivor_X = 40;
float survivor_Y = 40;
float survivor_W = 40;
float survivor_H = 40;
 
float move_1 = 0.2;
float move_2 = 0.4;
 
int size_change = 35;
 
int init_color = 100;
int color_change = 10;
  
  


//the class for survivors

class Survivor {
  static final int DIAM = 050, RAD = DIAM>>1;
  //declare the healthy person
  static final color HEALTHY  = #0000FF;
  //declare the boolean for infected person
  static final color INFECTED = #A08000;
  static final color INJURED  = #FF0000;

  static final color LABEL = 0300;

  final String name;
  //declares booleans for infected and injured 
  boolean isInfected = random(1) < .1? true:false;
  boolean isInjured  = random(1) < .3? true:false;

  byte bullets = (byte) random(11);

  short x  = (short) random(RAD, width  - RAD);
  short y  = (short) random(RAD, height - RAD);

  short vx = (short) (random(1, 6)*(random(1) < .5? -1:1));
  short vy = (short) (random(1, 6)*(random(1) < .5? -1:1));
  
  //name the survivors
  Survivor(String josh) {
    name = josh;
  }

  void update() {
    if ((x += vx) > width  - RAD | x < RAD)   vx *= -1;
    if ((y += vy) > height - RAD | y < RAD)   vy *= -1;
  }
  //display the people
  void display() {
    fill(whichColor());
    ellipse(x, y, DIAM, DIAM);

    fill(LABEL);
    text(name, x, y);
  }
  //display the colors according to the question
  private color whichColor() {
    if (isInjured)   return INJURED;
    if (isInfected)  return INFECTED;

    return HEALTHY;
  }
}

int amountOfPeoples = 15;
Survivor[] peoples;
//setup
void setup() {

  size(500, 400);
  background(255);
}

//draw
void draw()
{
  frameRate(30);
  //people loop for the survivors
  peoples = new Survivor[amountOfPeoples];
  for (int i = 0; i < amountOfPeoples; i++)
  {
    remakeSurvivors(i);
  }
  background(255);
  for (int i = 0; i < 5; i++)
  {
    peoples[i].display();
    peoples[i].update();
  }

  // Change the color of the circles when they touch each other.
  if(abs(2 * survivor_X - width) == survivor_W || abs(2 * survivor_Y - height) == survivor_H) {
    fill(255);
    println("hey!");
  } else if (abs(2 * survivor_X - width) < survivor_W || abs(2 * survivor_Y - height) < survivor_H) {
    fill(180, 130, 0);
    background(init_color - color_change);
  } else if (survivor_W >= 85 && survivor_H >= 85) {
    fill(255,0, 230);
  } else {
    fill(0, 200, 200);
  }
   
  // The first circle
  ellipse(survivor_X, survivor_Y, survivor_W, survivor_H);
   
  // The second circle that's 40 pixels (horizontally) right from the first circle.
  ellipse(width - survivor_X, survivor_Y, survivor_W, survivor_H);
   
  // The third circle that's 40 pixels below the first circle.
  ellipse(survivor_X, height - survivor_Y, survivor_W, survivor_H);
   
  // The fourth circle that's 40 pixels (horizontally) right from the third circle.
  ellipse(width - survivor_X, height - survivor_Y, survivor_W, survivor_H);
   
  // Make all circles move towards the center.
  survivor_X = survivor_X + move_1;
  survivor_Y = survivor_Y + move_2;
  
  if((height - (survivor_H / 2)) <= survivor_Y) {
    move_2 = -move_2;
    survivor_W = survivor_W + size_change;
    background(250, 255, 190);
    
  } else if ((survivor_H / 2) >= survivor_Y && move_2 < 0) {
    move_2 = -move_2;
    survivor_H = survivor_H + size_change;
    background(250, 255, 190);
     
  }
   
 
  if((width - (survivor_H / 2)) <= survivor_X) {
    move_1 = -move_1;
    background(250, 255, 190);
  } else if ((survivor_W / 2) >= survivor_X && move_1 < 0) {
    move_1 = -move_1;
    background(250, 255, 165);
     
    //println(frameCount);
  }
   
  
  if (abs(2 * survivor_X - width) < survivor_W || abs(2 * survivor_Y - height) < survivor_H && survivor_W >=150 && survivor_H >= 150) {
    frameRate(200);
  }
   
  // Print out the end message of these colliding balls.
  if(12094 <= frameCount) {
    fill(0);
    PFont font;
    font = loadFont("Cochin-BoldItalic-48.vlw");
    textFont(font, 32);
    text("Ultimate explosion!", 20, 150);
     
    noLoop();
  }
   
}

void remakeSurvivors(int numberOfSurvivor)
{
  //to return the value
  String name = "";
  int lengthOfName = int(random(3, 10));
  for (int i = 0; i < lengthOfName; i++) {
    name += char(int(random(97, 122)));
  }
  peoples[numberOfSurvivor] = new Survivor(name);
}         

