//list of all the colors in the array
final color[] listOfColors =
{
  color(255, 0, 0), 
  color(255, 98, 0), 
  color(254, 255, 0), 
  color(0, 255, 0), 
  color(0, 0, 255),
};

int colorIndex = 0;

//drawing of th ellipses
void setup()
{
  size(1000, 500);
  background(255);
  fill(listOfColors[0]);
  ellipse(100, height/2, 50, 50);
  fill(listOfColors[1]);
  ellipse(150, height/2, 50, 50);
  fill(listOfColors[2]);
  ellipse(200, height/2, 50, 50);
  fill(listOfColors[3]);
  ellipse(250, height/2, 50, 50);
  fill(listOfColors[4]);
  ellipse(300, height/2, 50, 50);
  fill(listOfColors[0]);
  ellipse(350, height/2, 50, 50);
  fill(listOfColors[1]);
  ellipse(400, height/2, 50, 50);
  fill(listOfColors[2]);
  ellipse(450, height/2, 50, 50);
  fill(listOfColors[3]);
  ellipse(500, height/2, 50, 50);
  fill(listOfColors[4]);
  ellipse(550, height/2, 50, 50);
}

//mousePressed wont work without this 
void draw()
{
}
//for changing the color of every button.
void mousePressed()
{
  println(mouseX);
  int w = 100;
  int min, max;

  min = 75;
  max = 125;
  int dia = 50;
  int i = 1;
  if (mouseX >= 75 && mouseX<=125)
  {
    w = 100;
  }
  min += dia;
  max += dia;
  i++;
  if (mouseX >= 125 && mouseX<=175)
  {
    w = 150;
  }
  min += dia;
  max += dia;
  i++;
  if (mouseX >= 175 && mouseX<=225)
  {
    w = 200;
  }
  min += dia;
  max += dia;
  i++;
  if (mouseX >= 225 && mouseX<=225+50)
  {
    w = 250;
  }
  min += dia;
  max += dia;
  i++;
  if (mouseX >= 225+50 && mouseX<=225+100)
  {
    w = 300;
  }
  min += dia;
  max += dia;
  i++;
  if (mouseX >= 225+100 && mouseX<=225+150)
  {
    w = 350;
  }
  min += dia;
  max += dia;
  i++;
  if (mouseX >= 225+150 && mouseX<=225+200)
  {
    w = 400;
  }
  min += dia;
  max += dia;
  i++;
  if (mouseX >= 225+200 && mouseX<=225+250)
  {
    w = 450;
  }
  min += dia;
  max += dia;
  i++;
  if (mouseX >= 225+250 && mouseX<=225+300)
  {
    w = 500;
  }
  min += dia;
  max += dia;
  i++;
  if (mouseX >= 225+300 && mouseX<=225+350)
  {
    w = 550;
  }
  min += dia;
  max += dia;
  i++;
  fillColor(w);
}

//w is the width of each ball/button
void fillColor(int w)
{
  fill(listOfColors[colorIndex]);
  colorIndex = (colorIndex + 1);
  if (colorIndex >= listOfColors.length)
  {
    colorIndex = 0;
  }

  ellipse(w, height/2, 50, 50);
}

