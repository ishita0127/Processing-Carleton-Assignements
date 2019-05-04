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

