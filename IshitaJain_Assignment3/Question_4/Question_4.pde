PFont f;
//for toggling the colours.
boolean buttonA, buttonB, buttonC;

final color blankScreenColor=color(255);

final color redColor=color(240, 0, 0);
final color greenColor=color(0, 240, 0);
final color blueColor=color(0, 0, 240);
final color orangeColor=color(255, 170, 0);

color currentColor;
color currentColorR;
color currentColorG;
color currentColorB;
color currentColorO;


void setup()
{
  size(700, 500);

  background(blankScreenColor);
  currentColor=redColor;
  currentColorR = redColor;
  currentColorG = greenColor;
  currentColorB = blueColor;
  currentColorO = orangeColor;
  noStroke();
  f= createFont("Arial", 30, true);
  buttonA = true;
  buttonB = true;
  buttonC = true;
}

void draw()
{


  fill(currentColorR);

  rect(100, 200, 100, 150);

  fill(currentColorB);

  rect(300, 200, 100, 150);

  fill(currentColorG);

  rect(500, 200, 100, 150);

  textFont(f);       
  fill(0);
  textAlign(CENTER);
  text("A", 150, 275);
  text("B", 350, 275);
  text("C", 550, 275);
}

void keyPressed()
{
  if (key == 'a' )
  {
    if (buttonA) {
      currentColorR=blueColor;
      rect(100, 200, 100, 150);
      buttonA = false;
    } else {
      currentColorR=redColor;
      rect(100, 200, 100, 150);
      buttonA = true;
    }
  } else if (key == 'b')
  {
    if (buttonB)
    {
      currentColorB=greenColor;
      rect(300, 200, 100, 150);
      buttonB = false;
    } else {
      currentColorB=blueColor;
      rect(300, 200, 100, 150);
      buttonB = true;
    }
  } else if (key == 'c')
  { 
    if (buttonC)
    {
      currentColorG=orangeColor;
      rect(500, 200, 100, 150);
      buttonC= false;
    } else {
      currentColorG=greenColor;
      rect(500, 200, 100, 150);
      buttonC= true;
    }
  }
}

