size(500,500);

int roadMarkingX=75;
int roadMarkingY=75;
int roadMarkingHeightX=20;
int roadMarkingHeightY=20;
int carLowerBodyWidthX=150;
int carLowerBodyHeightX=75;
//Using this variable made it easy to figure out where the upper rectangle should actually come.
//and how much area is left out which made it easier to position the windows.
int carUpperBodyWidthX=carLowerBodyWidthX-50;
int carUpperBodyHeightX=carLowerBodyHeightX-15;
int carWheelsX=30;
int carWindowsX=15;
int carHeadLightX=10;
int smokeX=15;


//background
fill(41,201,47);
rect(0,0,width,350);

//road
fill(117,118,117);
rect(0,350,width,150);

//marking(1) on road
fill(255);
rect(100,400,roadMarkingX,roadMarkingHeightX);

//marking(2) on road
fill(255);
rect(350,400,roadMarkingY,roadMarkingHeightY);

//car lower body
noStroke();
fill(0,27,255);
rect(150,275,carLowerBodyWidthX,carLowerBodyHeightX);

//car upper body
noStroke();
fill(0,27,255);
rect(175,225,carUpperBodyWidthX,carUpperBodyHeightX);

//car back wheel 
fill(5,5,5);
ellipse(180,365,carWheelsX,carWheelsX);

//car front wheel
fill(5,5,5);
ellipse(270,365,carWheelsX,carWheelsX);

//car back window
fill(255);
rect(200,250,carWindowsX,carWindowsX);

//car front window
fill(255);
rect(240,250,carWindowsX,carWindowsX);

//car head light
fill(255,0,0);
rect(290,275,carHeadLightX,carHeadLightX);

fill(255,0,0);
rect(290,290,carHeadLightX,carHeadLightX);

//smoke
fill(136,137,113);
ellipse(140,315,smokeX,smokeX);
ellipse(130,310,smokeX,smokeX);
ellipse(120,305,smokeX,smokeX);
ellipse(140,335,smokeX,smokeX);
ellipse(130,330,smokeX,smokeX);
ellipse(120,325,smokeX,smokeX);

//door
fill(0);
stroke(0);
strokeWeight(1);
line(175,275,175,370);
line(275,275,275,370);
line(175,275,300,275);
line(225,225,225,350);
ellipse(185,310,10,10);
ellipse(235,310,10,10);

//sun
noStroke();
fill(250,255,0);
ellipse(90,90,70,70);
