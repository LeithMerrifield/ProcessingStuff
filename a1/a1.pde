/*
  Auther: Leith Merrifeld
  Description: Main file that holds the game loop and creation of classes
  Date: 7/03/2020
  Modified: 9/03/20
*/

PImage bimg;
ArrayList<Ufo> UFOs = new ArrayList<Ufo>();
int ufoCount = 20;

void setup()
{
  size(800,450);
  bimg = loadImage("map.png");
  frameRate(60);
  noSmooth();
  textSize(18);
  
  //creates as many ufos as you please
  for(int i = 0; i < ufoCount; i++)
  {
    UFOs.add(new Ufo());
  }
}

void draw()
{
  clear();
  image(bimg,0,0);
  UpdateUFO();
}

// runs the draw loop for all the ufos and the collision check
void UpdateUFO()
{ 
  for(int i = 0; i < UFOs.size(); ++i)
  {
    for(int x = 0; x < UFOs.size(); ++x)
    {
        if(i != x)
          UFOs.get(i).CheckProximity(UFOs.get(x));
    }
  }
  
  for(Ufo ufo : UFOs)
  {
    ufo.OnDraw();
  }
}
