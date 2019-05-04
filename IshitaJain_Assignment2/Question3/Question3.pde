size(500,500);
background(255);
//house width is 150 and height is 200 in the code given it was the opposite
int houseWidth=150;
int houseHeight=200;
int houseX= width/2;
int houseY=height*2/3;

fill(70,162,31);
rect(0, houseY, width,height/3);

fill(234,210,121);
rectMode(CENTER);
rect(houseX,houseY,houseWidth,houseHeight);

fill(234,121,125);

triangle(houseWidth/2+100, //x1
//for the roof(triangle) the first coordinate should be 175 which is the corner of the rectangle whereas in the given code it was 250+100=350
         houseY-100, //y1
         //the y coordinate for the corner of the rectangle is height*2/3 + half of the
         // height of the house
         //in the given code the is height*2/3-half of the height of the house
         //whereas the value should have been height*2/3-100
         houseX,//x2// the center of the rectangle would be same for the triangle
         houseY-houseHeight,//y2 //height does not need to be divided by 2
         houseX+houseWidth/2,//x3 // if the width would have been 150 the the given code would have been correct
         houseY-100);//y3 it deosnt need to be subtracted by anything else other than half of house height
         
