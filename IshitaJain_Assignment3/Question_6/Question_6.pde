boolean titleScreen = true;
boolean play = false;
boolean gameEnd = false;

float paddleOneX = 25;
float paddleOneY = 250;
float paddleOneWidth = 30;
float paddleOneHeight = 100;

float paddleTwoX = 465;
float paddleTwoY = 250;
float paddleTwoWidth = 30;
float paddleTwoHeight = 100;

float paddleSpeed = 10;

boolean upPressed = false;
boolean downPressed = false;
boolean wPressed = false;
boolean sPressed = false;

int playerOneScore = 0;
int playerTwoScore = 0;

float ballX = 250;
float ballY = 250;
float radius = 10;
float ballChangeX = -1;
float ballChangeY = 3;

void setup() {
  size(500, 600);

  ellipseMode(CENTER);
  ellipseMode(RADIUS);


  stroke(255, 255, 255);
}

void keyPressed() {
  if (titleScreen) {
    if (key == 'P' || key == 'p') {
      titleScreen = false;
      play = true;
    }
  } else if (play) {
    if (key == CODED) {
      if (keyCode == UP) {
        upPressed = true;
      } else if (keyCode == DOWN) {
        downPressed = true;
      }
    } else if (key == 'W' || key == 'w') {
      wPressed = true;
    } else if (key == 'S' || key == 's') {
      sPressed = true;
    }
  } else if (gameEnd) {
    if (key == ' ') {
      gameEnd = false;
      titleScreen = true;
      paddleOneY = 250;
      paddleTwoY = 250;
      ballX = 250;
      ballY = 250;
      playerOneScore = 0;
      playerTwoScore = 0;
    }
  }
}

void keyReleased() {
  if (play) {
    if (key == CODED) {
      if (keyCode == UP) {
        upPressed = false;
      } else if (keyCode == DOWN) {
        downPressed = false;
      }
    } else if (key == 'W' || key == 'w') {
      wPressed = false;
    } else if (key == 'S' || key == 's') {
      sPressed = false;
    }
  }
}

void draw() {
  if (titleScreen) {
    background(0, 0, 0);

    textSize(36);
    text("Pong", 165, 100);

    textSize(18);
    text("Press 'P' to play.", 175, 400);
  } else if (play) {
    background(0, 0, 0);

    if (upPressed) {
      if (paddleOneY-paddleSpeed > 0) {
        paddleOneY -= paddleSpeed;
      }
    }
    if (downPressed) {
      if (paddleOneY + paddleSpeed + paddleOneHeight < height) {
        paddleOneY += paddleSpeed;
      }
    }
    if (wPressed) {
      if (paddleTwoY-paddleSpeed > 0) {
        paddleTwoY -= paddleSpeed;
      }
    }
    if (sPressed) {
      if (paddleTwoY + paddleSpeed + paddleTwoHeight < height) {
        paddleTwoY += paddleSpeed;
      }
    }

    float nextBallLeft = ballX - radius + ballChangeX;
    float nextBallRight = ballX + radius + ballChangeX;
    float nextBallTop = ballY - radius + ballChangeY;
    float nextBallBottom = ballY + radius + ballChangeY;

    float paddleOneRight = paddleOneX + paddleOneWidth;
    float paddleOneTop = paddleOneY;
    float paddleOneBottom = paddleOneY + paddleOneHeight;

    float paddleTwoLeft = paddleTwoX;
    float paddleTwoTop = paddleTwoY;
    float paddleTwoBottom = paddleTwoY + paddleTwoHeight;


    if (nextBallTop < 0 || nextBallBottom > height) {
      ballChangeY *= -1;
    }


    if (nextBallLeft < paddleOneRight) { 

      if (nextBallTop > paddleOneBottom || nextBallBottom < paddleOneTop) {
        playerTwoScore ++;

        if (playerTwoScore == 3) {
          play = false;
          gameEnd = true;
        }

        ballX = 250;
        ballY = 250;
      } else {
        ballChangeX *= -1;
      }
    }


    if (nextBallRight > paddleTwoLeft) {

      if (nextBallTop > paddleTwoBottom || nextBallBottom < paddleTwoTop) {
        playerOneScore ++;

        if (playerOneScore == 3) {
          play = false;
          gameEnd = true;
        }

        ballX = 250;
        ballY = 250;
      } else {
        ballChangeX *= -1;
      }
    }

    ballX += ballChangeX;
    ballY += ballChangeY;

    //dashed line down center
    for (int lineY = 0; lineY < height; lineY += 50) {
      line(250, lineY, 250, lineY+50);
    }
    noFill();
    strokeWeight(5);
    ellipse(width/2, height/2, 100, 50);
    //"goal lines" on each side
    line(paddleOneRight, 0, paddleOneRight, height);
    line(paddleTwoLeft, 0, paddleTwoLeft, height);

    textSize(36);
    text(playerOneScore, 100, 100);
    text(playerTwoScore, 400, 100);

    fill(0, 255, 0);
    rect(paddleOneX, paddleOneY, paddleOneWidth, paddleOneHeight);
    fill(255, 0, 0);
    rect(paddleTwoX, paddleTwoY, paddleTwoWidth, paddleTwoHeight);
    fill(0, 0, 255);
    ellipse(ballX, ballY, radius, radius);
  } else if (gameEnd) {
    background(0, 0, 0);

    textSize(36);
    text(playerOneScore, 100, 100);
    text(playerTwoScore, 400, 100);

    textSize(36);
    if (playerOneScore > playerTwoScore) {
      text("Player 1 Wins!", 165, 200);
    } else {
      text("Player 2 Wins!", 165, 200);
    }

    textSize(18);
    text("Press space to restart.", 150, 400);
  }
}

