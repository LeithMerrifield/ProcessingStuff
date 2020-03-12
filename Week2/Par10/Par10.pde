int x = 100;
int y = 100;
int thesize = 64;
int offset = thesize/4; // position of wheels relative to car

void setup()
{
  size(200,200);
  background(255);
  // draw main car body (i.e. a rect)
  rectMode(CENTER);
}

void draw()
{
  stroke(0);
  DrawCar(x,y,thesize,150);
}





void DrawCar(int newX, int newY, int theSize, color colour)
{
  fill(colour);
  rect(newX,y,theSize,theSize/2);
  fill(0);
  rect(newX-offset,newY-offset,offset,offset/2);
  rect(newX+offset,newY-offset,offset,offset/2);
  rect(newX-offset,newY+offset,offset,offset/2);
  rect(newX+offset,newY+offset,offset,offset/2);
}
