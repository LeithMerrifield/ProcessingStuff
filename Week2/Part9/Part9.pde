int start = 40;
int stop = 320;
boolean opening = false;
void setup(){
  size(200,200);
  background(64,190,255);
  frameRate(150);
}

void draw(){
  background(64,190,255);
  stroke(255,212,36);
  fill(255,212,36);
  
  DisplayPacMan();
  CheckMouth();
  
}

void DisplayPacMan()
{
  //Whats going on here?
  //do some reasearch on the Processing reference page for the arc() function
  arc(100,100,150,150, radians(start), radians(stop));
  fill(64,190,255);
  ellipse(100,75,10,10);
  
}

void CheckMouth()
{
  if(opening == false)
  {
    //Mouth is closing
    start = start - 1;
    stop = stop + 1;
    if(start == 0)
    {
      opening = true;
    }
  }
  else
  {
    //Mouth is openening
    start = start + 1;
    stop = stop - 1;
    if(start == 40){
      opening = false;
    }
  }
}
