//declaring variables for the ball
Ball ball;
Paddle paddle;
//array for the bricks
ArrayList bricks;
//start the gaem with mouse click
boolean gameStart = false;
int count = 0;
//game finishes after the ball falls of the paddle
boolean gameOver = false;
//variable for score
int playerScore=0;
//lives
int yourFate =3;
//paddle height
int paddleHeight=10;
//paddle width
int paddleWidth=50;
//shrinking the paddle
boolean hitTop=false;
//ball speed
boolean increaseSpeed=false;

void setup()
{
  size(400, 400);
  smooth();
  frameRate(20);
  ball = new Ball();
  paddle = new Paddle();
  bricks = new ArrayList();
  //the red color bricks
  for (int i = 0; i < 7; i++)
  {
    Brick b = new Brick();
    b.setLocation((50*i) + 30, 80);//location of the brick
    b.setcolorBrick(1);//color red
    bricks.add(b);
  }
  for (int i = 0; i < 7; i++)
  {
    Brick b = new Brick();
    b.setLocation((50*i) + 30, 90);
    b.setcolorBrick(1);
    bricks.add(b);
  }
  for (int i = 0; i < 7; i++)
  {
    Brick b = new Brick();
    b.setLocation((50*i) + 30, 100);
    b.setcolorBrick(2);//color orange 
    bricks.add(b);
  }
  for (int i = 0; i < 7; i++)
  {
    Brick b = new Brick();
    b.setLocation((50*i) + 30, 110);
    b.setcolorBrick(2);
    bricks.add(b);
  }
  for (int i = 0; i < 7; i++)
  {
    Brick b = new Brick();
    b.setLocation((50*i) + 30, 120);
    b.setcolorBrick(3);//color green 
    bricks.add(b);
  }
  for (int i = 0; i < 7; i++)
  {
    Brick b = new Brick();
    b.setLocation((50*i) + 30, 130);
    b.setcolorBrick(3);
    bricks.add(b);
  }
  for (int i = 0; i < 7; i++)
  {
    Brick b = new Brick();
    b.setLocation((50*i) + 30, 140);
    b.setcolorBrick(4);//color yellow
    bricks.add(b);
  }
  for (int i = 0; i < 7; i++)
  {
    Brick b = new Brick();
    b.setLocation((50*i) + 30, 150);
    b.setcolorBrick(4);
    bricks.add(b);
  }
}


void draw()
{ 
  background(0);



  for (int i = 0; i < bricks.size (); i++)
  {
    Brick b = (Brick) bricks.get(i);
    b.display();
    if (b.intersect(ball))//for the interaction between the ball 
        //    and the pick and the paddle
    {
      ball.yspeed *= -1;//speeed to increase 
      b.colorBrick -= 1;//brick to be removed
      //indication to decrese one brick everytime the ball hits the brick
      if (b.getcolorBrick()>= 0)
      {
        bricks.remove(b);//remove(b)means remove one brick
        if (b.getcolorBrick()==3)
        {
          playerScore+=1;
        } else if (b.getcolorBrick()==2)
        {
          playerScore+=3;
        } else if (b.getcolorBrick()==1)
        {
          playerScore+=5;
        } else
        {
          playerScore+=7;
        }

        if (b.getcolorBrick()>=2)
        {
          ball.xspeed=ball.yspeed*(-2);
        }
      }
    }
  }
  paddle.setLocation(mouseX, height - 30);
  paddle.display();

  if (bricks.size() == 0)
  {
    gameOver = true;
    gameStart = false;
  }

  if (gameStart)
  {
    ball.move();
    ball.display();
    if (paddle.intersect(ball))
    {
      ball.yspeed *= -1;
    }
  } else
  {
    PFont f = createFont("Arial", 20, true);
    textFont(f);
    fill(255);
    textAlign(CENTER);


    if (count == 0)
    {
      text("Click mouse to start", width/2, height/2);
    } else if (gameOver)
    {
      text("Congratulations! You won!", width/2, height/2);
    } else
    {
      text("Game Over", width/2, height/2);
    }
  }
  fill(0, 255, 0);
  text(playerScore, width/2+40, 20);
  text("YOUR SCORE", width/2-60, 20);
}


void mouseClicked()
{
  gameStart = true;
  count++;
}


class Ball
{
  float x, y, xspeed, yspeed, radius;
  Ball()
  {
    x = 0;
    y = height - 1;
    xspeed = 4;
    yspeed = -4;
    radius = 5;
    fill(255, 0, 0);
    text(yourFate, width/3, height-50);
  }


  void move()
  {
    x += xspeed;
    y += yspeed;
    if ((x > width) || (x < 0))
    {
      xspeed *= -1;
    }

    if (y < 0)
    {
      yspeed *= -1;
    }
    //paddle shrunk to half after touching the top roof
    if (y<=90)
    {
      if (hitTop==false)
      {
        paddleWidth=paddleWidth/2;
        hitTop=true;
      }
    }
    //increase ball speed
    if (y<=110);
    {
      if (increaseSpeed==false)
      {
        xspeed=xspeed*2;
        increaseSpeed=true;
      }
    }

    if (y<=130)
    {
      if (increaseSpeed==false)
      {
        xspeed=xspeed*4;
        increaseSpeed=true;
      }
    }

    //lives to play/chances to play
    if (y >= height)
    {
      if (yourFate==3)
      {
        yourFate=yourFate-1;
      } else if (yourFate==2)
      {
        yourFate=yourFate;
      } else if (yourFate==1)
      {
        yourFate=yourFate-1;
      } else
      {
        gameOver=true;
      }
    }


    fill(255, 0, 0);
    text(yourFate, width/3, height-50);
    text("your fate", width/3-50, height-50);
  }

  void display()
  {
    stroke(0);
    fill(255);
    ellipse(x, y, radius*2, radius*2);
  }
}

//draw paddle
class Paddle
{
  float x, y;
  Paddle()
  {
    x = width / 2;
    y = height - 30;
  }

  void setLocation(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  void display()
  {
    stroke(0);
    fill(0, 0, 255);
    rect(x, y, paddleWidth, paddleHeight);
  }

  boolean intersect(Ball b)
  {
    float p1 = x;
    float p2 = x + 50;
    if ((b.y + b.radius) >= y)
    {
      if ((b.x >= p1) && (b.x <= p2))
      {
        return true;
      } else
      {
        return false;
      }
    } else
    {
      return false;
    }
  }
}


class Brick
{
  float x, y;
  color c;
  int colorBrick;//variable for color
  Brick()
  {
    colorBrick = 4;//number of colours
  }

  void setLocation(float x, float y)
  {
    this.x = x;
    this.y = y;
  }

  void display()
  {
    stroke(0);
    setColor();
    fill(c);
    rect(x, y, 50, 10);
  }

  void setColor()
  {
    switch(colorBrick)
    {
    case 1:
      c = color(255, 0, 0);//red
      break;
    case 2:
      c = color(255, 166, 0);//orange
      break;
    case 3:
      c = color(0, 255, 0);//green
      break;

    case 4:
      c= color(255, 255, 0);//yellow
    }
  }

  int getcolorBrick()
  {
    return colorBrick;
  }

  void setcolorBrick(int colorB)
  {
    colorBrick = colorB;
  }

  boolean intersect(Ball b)
  {
    float p1 = x;
    float p2 = x + 50;
    if (((b.y + b.radius) >= y) && ((b.y + b.radius) <= y + 10))
    {
      if ((b.x >= p1) && (b.x <= p2))
      {
        return true;
      } else
      {
        return false;
      }
    } else
    {
      return false;
    }
  }
}

