//circle/ellipse radius

int circleX = 50;

void setup() {
  size(480, 480);
  fill(0, 102);
  // smooth();
  noStroke();
}

void draw() {
  int x = mouseX;
  int y = mouseY;
  println("mouseX=  ", mouseX, "mouseY= ", mouseY);
  //  println(mouseX);
  if (mousePressed) {
  background(204);
  if (x < 10){
     if (y < 10){
         ellipse(10, 10, circleX,circleX); // both x and y are at lower edge
     } else 
     if (y > 470){
         ellipse(10, 470, circleX,circleX); // X at lower edge, y at upper edge
     }
     else {
       ellipse(10,y,circleX,circleX);  // only X at lower edge 
     }
     } // done checking for X at lower edge   
     else { // now check X at upper edge
      if (x > 470){
     if (y < 10){
         ellipse(470, 10, circleX,circleX); // X at upper edge and y are at lower edge
     } else 
     if (y > 470){
         ellipse(470, 470,circleX,circleX); // both x and y at upper edge
     }
     else {
       ellipse(470,y,circleX,circleX);  // only X at upper edge 
     }
     } // done checking for X at upper edge
    else {  // x is in range
           if (y < 10){
         ellipse(x, 10,circleX,circleX); // X at upper edge and y are at lower edge
     } else 
     if (y > 470){
         ellipse(x, 470, circleX,circleX); // both x and y at upper edge
     }
     else {
     ellipse(x,y,circleX,circleX);
  }
    }
  }
}
}
