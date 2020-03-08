PImage bimg;
ArrayList<Ufo> UFOs = new ArrayList<Ufo>();

void setup()
{
  size(800,450);
  // set size of window and load images, the UFO is done for you.
  bimg = loadImage("map.png");
  frameRate(60);
  noSmooth();
  for(int i = 0; i < 10; i++)
  {
    UFOs.add(new Ufo());
  }
}

void draw()
{
  clear();
  image(bimg,0,0);
  
  for(Ufo ufo : UFOs)
  {
    ufo.OnDraw();
  }
  
  for(int i = 0; i < UFOs.size(); ++i)
  {
    for(int x = 0; x < UFOs.size(); ++x)
    {
      if(x != i)
        UFOs.get(i).checkCollision(UFOs.get(x));
    }
  }
 
}
