 /*
  Auther: Leith Merrifeld
  Description: Holds the UFO class that is responsible for all of its logic
               including edge detection and collision
  Date: 8/03/2020
  Modified: 9/03/20
*/

 class Ufo
{
  PImage ufo;
  Vector3 position = new Vector3(); // These initial values should be random
  Vector3 velocity = new Vector3();
  Vector3 direction = new Vector3(1f,1f);
  float speed = .7;
  float diameter = 60;
  float radius = diameter / 2;
  
  // ufo constructor that loads the gif and creates some randomness to the game
  Ufo()
  {
      ufo = loadImage("KritaSaucer.gif");
      position.x = random(0,width - diameter);
      position.y = random(0,height - diameter);
      
      // 50/50 on each axis to invert
      if(random(0,50) >= 25)
        direction.x = -1.0f;
      if(random(0,50) >= 25)
        direction.y = -1.0f;
  }
  
  // main draw loop for ufo
  void OnDraw()
  {
    Movement();
    BoundaryCheck();
    image(ufo, position.x, position.y,diameter,diameter);
    CardinalDirection();
  }
  
  // velocity is created based on direction and speed
  void Movement()
  {   
    velocity.add(direction);
    velocity.mult(speed);
    position.add(velocity);
  }
  
  // checks to see if the ufo is close to another
  // if so then move in the inverse direction of the
  // directionVector
  void CheckProximity(Ufo other)
  {  
    Vector3 directionVec = Vector3.sub(other.position, position);
    float distance = directionVec.mag();
    
    if(distance < (radius + other.radius))
    {
       directionVec.normalise();
       directionVec.mult(-1f);
       direction = directionVec;
    }
  }
  
  // Checks to see if the ufo is out of bounds
  // if so then reverse direction and move out 
  // the right amount from the wall
  void BoundaryCheck()
  {
    // Left and right
    if(position.x + diameter > width)
    {
      direction.x *= -1;
      velocity.x *= -1;
      position.x = width - diameter;
    }
    else if(position.x < 0)
    {
      direction.x *= -1;
      velocity.x *= -1;
      float temp = position.x;
      position.x = (-1*temp);
    }
    
    // Top and Bottom
    if(position.y + diameter > height)
    {
      direction.y *= -1;
      velocity.y *= -1;
      position.y = height - diameter;
    }
    else if(position.y < 0)
    {
      direction.y *= -1;
      velocity.y *= -1;
      float temp = position.y;
      position.y = (-1*temp);
    }
  }
  
  // depending on the direction determine the cardinal direction
  // and print it to console and the ufo on screen
  void CardinalDirection()
  {
    String cardDirection;
    
    cardDirection = direction.y < 0 ? "North-" : "South-";
    cardDirection += direction.x > 0 ? "East" : "West";
    fill(255,255, 0);
    text(cardDirection,position.x - (radius / 2),position.y + radius);
    println(cardDirection);
  }
}
