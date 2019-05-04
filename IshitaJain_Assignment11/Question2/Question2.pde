
class RiskWildlife
{
  String Wildlife;
  int[] millions_2014;
  int total_2014;
}

RiskWildlife[] WildlifeData;

final String filename = "COSEWIC_EN.csv";


//////////////////////////////////////////////////
// Data that will help draw the circles

int totalTopWildlife;
final int numRows = 3;
final int numCols = 3;

final int maxCircleWidth = 120;
final int maxCircleHeight = 120;

//////////////////////////////////////////////////
// Data that will help draw the line graph

int graphShowingIndex;

//////////////////////////////////////////////////
// Data that will help with sorting

boolean lastSortedOrderWasAlphabetical;






//////////////////////////////////////////////////
// setup
void setup()
{
  size(750, 750);

  // Get the data from the CSV file
  readData();


  totalTopWildlife = sumTotalForTopNWildlife(numRows * numCols);


  graphShowingIndex = -1;

  lastSortedOrderWasAlphabetical = false;
  sortWildlifeData(numRows * numCols);
}


void draw()
{
  background(255,0,190);

  drawTopNWildlife();

  if (graphShowingIndex >= 0)
  {
    drawLineGraph(graphShowingIndex);
  }
}


void readData()
{
  String[] lines = loadStrings(filename);


  int numEntities = lines.length - 6;

  WildlifeData = new RiskWildlife[numEntities];


  int lineIndex = 0;
  while (lineIndex < lines.length)
  {
    // Skip the first and last three lines
    if (lineIndex < 3 || lineIndex >= lines.length - 3)
    {
      lineIndex++;
      continue;
    }

    int WildlifeNum = lineIndex - 3;

    String[] splitLine = lines[lineIndex].split(",");

    WildlifeData[WildlifeNum] = new RiskWildlife();

    WildlifeData[WildlifeNum].Wildlife = splitLine[0];

    WildlifeData[WildlifeNum].millions_2014 = new int[4];
    WildlifeData[WildlifeNum].millions_2014[0] = Integer.parseInt(splitLine[1]);
    WildlifeData[WildlifeNum].millions_2014[1] = Integer.parseInt(splitLine[2]);
    WildlifeData[WildlifeNum].millions_2014[2] = Integer.parseInt(splitLine[3]);
    WildlifeData[WildlifeNum].millions_2014[3] = Integer.parseInt(splitLine[4]);

    WildlifeData[WildlifeNum].total_2014 = Integer.parseInt(splitLine[5]);

    lineIndex++;
  }
}


int sumTotalForTopNWildlife(int n)
{
  int WildlifeNum = 0;
  int sum = 0;
  while (WildlifeNum < n)
  {
    sum += WildlifeData[WildlifeNum].total_2014;
    WildlifeNum++;
  } 

  return sum;
}


int maxTotalForTopNWildlife(int n)
{
  int WildlifeNum = 0;
  int max = -1;
  while (WildlifeNum < n)
  {
    if (max < WildlifeData[WildlifeNum].total_2014)
    {
      max = WildlifeData[WildlifeNum].total_2014;
    }

    WildlifeNum++;
  } 

  return max;
}


float getXCoordinateForRowAndCol(int rowNum, int colNum)
{
  return (colNum+1)*getHorizontalSpacing()
    + colNum*maxCircleWidth  
      + maxCircleWidth/2;
}

float getYCoordinateForRowAndCol(int rowNum, int colNum)
{
  return (rowNum+1)*getVerticalSpacing()
    + rowNum*maxCircleHeight 
      + maxCircleHeight/2;
}


float getHorizontalSpacing()
{
  return (width - numCols*maxCircleWidth)/(float)(numCols+1);
}

float getVerticalSpacing()
{
  return (height - numRows*maxCircleHeight)/(float)(numRows+1);
}

void drawTopNWildlife()
{
  final int numCircles = numRows * numCols;

  final float spaceHor = getHorizontalSpacing();
  final float spaceVer = getVerticalSpacing();

  final int maxTotal = maxTotalForTopNWildlife(numCircles);


  int rowNum = 0;
  while (rowNum < numRows)
  {
    int colNum = 0;
    while (colNum < numCols)
    {
      // Convert row, col to a 1D index
      int index = rowNum*numCols + colNum;

      float circleWidth = WildlifeData[index].total_2014 / 
      (float)maxTotal
        * maxCircleWidth;

      float circleHeight = WildlifeData[index].total_2014 / 
      (float)maxTotal 
        * maxCircleHeight;

      final float x = getXCoordinateForRowAndCol(rowNum, colNum);
      final float y = getYCoordinateForRowAndCol(rowNum, colNum);




      rectMode(CENTER); 

      fill(255);
      stroke(210);
      rect(x, y, maxCircleWidth + spaceHor/5, maxCircleHeight + spaceVer/5);


      noStroke();

      float alphaTransparency = 
        (circleWidth / (float)maxCircleWidth * 150) + 100;

      fill(0, 0, 255, alphaTransparency);
      ellipse(x, y, circleWidth, circleHeight);


      // Draw the country label

      fill(0);
      textAlign(CENTER, BOTTOM);
      textSize(15);
      text(WildlifeData[index].Wildlife, 
      x, y + maxCircleHeight/2 - spaceVer/2, 
      maxCircleWidth - 20, spaceVer);


      colNum++;
    }
    rowNum++;
  }
}



void drawLineGraph(int index)
{
  final int padding = 40;

  final int rectWidth = (int)(width * 0.8f);
  final int rectHeight = (int)(height * 0.6f);

  final int axisX = width/2 - rectWidth/2 + padding;
  final int axisY = height/2 + rectHeight/2 - padding;
  final int axisHeight = rectHeight - 2 * padding;

  int numPoints = 4; // one for each quarter 2014
  int maxValue = max(WildlifeData[index].millions_2014);

  // Draw a rectangle to contain the graph
  stroke(3);
  fill(0);
  rect(width/2, height/2, rectWidth, rectHeight);

  // Label the country
  fill(0,255,0);
  textSize(18);
  textAlign(CENTER, CENTER);
  text(WildlifeData[index].Wildlife, width/2, height/2 + rectHeight/2 - padding/2); 

  // Draw axes
  line(axisX, axisY, axisX, height-axisY);
  line(axisX, axisY, width-axisX, axisY);

  // Figure out how much space to put between the points
  // on the graph
  int spacing = (rectWidth - 2*axisX)/numPoints;

  // Draw the line graph
  stroke(0, 255, 0);


  float lastPointX = axisX;
  float lastPointY = axisY;

  int pointNum = 0;
  while (pointNum < numPoints)
  {
    float yValue = WildlifeData[index].millions_2014[pointNum];
    yValue = yValue / maxValue * axisHeight;
    yValue = axisY - yValue;

    line(lastPointX, lastPointY, lastPointX+spacing, yValue);
    lastPointX = lastPointX+spacing;
    lastPointY = yValue;
    pointNum++;
  }
}



int getIndexOfEntityAt(int x, int y)
{
  int index = -1; // default: not found

  int rowNum = 0;
  while (rowNum < numRows)
  {
    int colNum = 0;
    while (colNum < numCols)
    {
      // Convert row, col to a 1D index
      int currIndex = rowNum*numCols + colNum;

      float currX = getXCoordinateForRowAndCol(rowNum, colNum);
      float currY = getYCoordinateForRowAndCol(rowNum, colNum);

      if (x >= currX - maxCircleWidth/2 && x <= currX + maxCircleWidth/2 &&
        y >= currY - maxCircleHeight/2 && y <= currY + maxCircleHeight/2)
      {
        index = currIndex;
        break;
      }

      colNum++;
    }
    rowNum++;
  }

  return index;
}


//////////////////////////////////////////////////
// mouseClicked
void mouseClicked()
{
  // Turn off the graph if it was on
  if (graphShowingIndex >= 0)
  {
    graphShowingIndex = -1;
  }
  // Otherwise, figure out what index we clicked
  else
  {
    graphShowingIndex = getIndexOfEntityAt(mouseX, mouseY);
  }
}


//////////////////////////////////////////////////
// Use this function to sort the first n data objects 
// alphabetically according to their country names
// using insertion sort
void sortWildlifeDataAlphabetically(int n)
{
  int currentStartIndex = 1;
  while (currentStartIndex < n)
  {
    int innerIndex = currentStartIndex;
    while (innerIndex > 0 &&
      WildlifeData[innerIndex].Wildlife.compareTo(
    WildlifeData[innerIndex-1].Wildlife) < 0)
    {
      // Swap the current "inner indexed" value with the one before it
      RiskWildlife temp = WildlifeData[innerIndex-1];
      WildlifeData[innerIndex-1] = WildlifeData[innerIndex];
      WildlifeData[innerIndex] = temp;

      innerIndex--;
    }

    currentStartIndex++;
  }
}


//////////////////////////////////////////////////
// Use this function to sort the first n data objects 
// in descending order according to the total number
// of students in 2014
void sortWildlifeData(int n)
{
  int currentStartIndex = 1;
  while (currentStartIndex < n)
  {
    int innerIndex = currentStartIndex;
    while (innerIndex > 0 &&
      WildlifeData[innerIndex].total_2014 >
      WildlifeData[innerIndex-1].total_2014)
    {
      // Swap the current "inner indexed" value with the one before it
      RiskWildlife temp = WildlifeData[innerIndex-1];
      WildlifeData[innerIndex-1] = WildlifeData[innerIndex];
      WildlifeData[innerIndex] = temp;

      innerIndex--;
    }

    currentStartIndex++;
  }
}


//////////////////////////////////////////////////
// keyPressed
void keyPressed()
{
  if (key == 's')
  {
    if (lastSortedOrderWasAlphabetical)
    {
      sortWildlifeData(numRows * numCols);
      lastSortedOrderWasAlphabetical = false;
    } else
    {
      sortWildlifeDataAlphabetically(numRows * numCols);
      lastSortedOrderWasAlphabetical = true;
    }
  }
}

