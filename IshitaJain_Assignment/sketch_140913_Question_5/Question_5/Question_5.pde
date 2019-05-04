size (600,700);


//wall
int wallHeight=400;
fill(255,239,214);
rect(0,0,width,wallHeight);
//floor
fill(180,152,115);
rect(0,wallHeight,width,300);
//window
int windowHeight=50;
int windowWidth=75;
fill(155,192,255);
rect(100,100,windowWidth,windowHeight);
rect(400,100,windowWidth,windowHeight);
line(100,125,175,125);
line(400,125,475,125);
line(135,100,135,150);
line(435,100,435,150);

//painting

stroke(175,141,88);
strokeWeight(15);
fill(255);
rect(250,50,100,150);
fill(255,0,0);
noStroke();
ellipse(275,75,30,30);
fill(0,255,0);
ellipse(290,75,30,30);
fill(222,34,90);
ellipse(275,90,30,30);
fill(0,0,255);
ellipse(275,100,30,30);
fill(90,222,55);
ellipse(300,150,30,30);
fill(0,0,34);
ellipse(310,160,30,30);
fill(87,0,200);
ellipse(320,170,30,30);
rect(275,130,30,50);
fill(0,255,0);
rect(300,90,30,50);


//toystack
rect(100,550,30,50);
fill(190,20,200);
rect(160,550,30,50);
fill(0,0,255);
rect(110,520,90,30);
fill(255,0,0);
rect(90,490,90,30);

//ball doll
ellipse(530,550,90,90);
ellipse(525,485,50,50);
fill(0);
ellipse(520,480,10,10);
ellipse(540,480,10,10);
fill(253,147,255);
rect(520,520,10,10);
rect(520,540,10,10);
rect(520,560,10,10);
ellipse(530,500,20,20);
//ellipse(525,500,20,20);
//doll//snowman//robot
fill(255);
ellipse(300,500,60,60);
fill(0);
ellipse(310,490,10,10);
ellipse(290,490,10,10);
rect(290,505,20,10);
fill(255);
rect(275,530,50,80);
fill(0);
ellipse(275,530,10,10);
ellipse(275,540,10,10);
ellipse(275,550,10,10);
ellipse(325,530,10,10);
ellipse(325,540,10,10);
ellipse(325,550,10,10);

//stack of toys
fill(142,83,37);
stroke(0,255,0);
strokeWeight(5);
rect(390,550,50,50);
fill(183,117,67);
stroke(255,0,0);
strokeWeight(5);
rect(395,505,40,40);
fill(211,148,100);
stroke(0,0,255);
strokeWeight(5);
rect(400,470,30,30);
fill(232,191,159);
stroke(0,200,155);
strokeWeight(5);
rect(405,445,20,20);

//door
noStroke();
fill(82,28,1);
rect(0,190,130,210);
stroke(0);
strokeWeight(1);
rect(20,220,70,150);
rect(30,230,50,120);
fill(0);
rect(0,200,10,20);
rect(0,240,10,20);
rect(0,280,10,20);
rect(0,320,10,20);
rect(0,360,10,20);
noStroke();
fill(255);
ellipse(110,310,20,20);

//
stroke(0);
fill(84,98,170);
triangle(90,490,180,490,135,430);
fill(255,158,0);
triangle(105,485,165,485,135,445);
