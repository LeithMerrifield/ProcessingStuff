
void setup()
{
  size(500,500);
}

void draw()
{
  clear();
  mousePos();
  rollOverButton(50,50,50,50,"no");
}






float rectArea(int myWidth, int myHeight)
{ 
  return myWidth * myHeight;
}

float distance(Vector2 first, Vector2 second)
{
  Vector2 direction = Vector2.sub(second, first);
  return direction.mag();
}

void mousePos()
{
  String position;
  
  position = "X: " + mouseX + "Y: " + mouseY;
  text(position, width - 100, 30);

}

void rollOverButton(int x, int y, int myWidth, int myHeight, String text)
{
  
  if(mouseX < x + myWidth &&
     mouseX > x &&
     mouseY < y + myHeight &&
     mouseY > y)
   {
     fill(255,0,0);
   }
   else
   {
     fill(0,255,0);
   }
  
  rect(x,y,myWidth,myHeight);
}
