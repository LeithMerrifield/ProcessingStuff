float deltaTime = 0;
float previousTime = 0;
float newTime = 0;
Game game;
Menu menu;
GAMESTATE gameState = GAMESTATE.MENU;

void setup()
{
  size(900,900);
  smooth();
  frameRate(60);
  game = new Game();
  menu = new Menu();
}

void draw()
{
  DeltaTime();
  clear();
  
  switch(gameState)
  {
    case MENU:
      MenuLoop();
      break;
    case PLAYING:
      PlayingLoop();
      break;
  }
}

void MenuLoop()
{
  if(!menu.entryFlag)
    menu.OnEntry();
  
  menu.OnUpdate();
  menu.OnDraw();
}

void PlayingLoop()
{
  if(!game.entryFlag)
    game.OnEntry();
    
  game.OnUpdate();
  game.OnDraw();
}

// fires when a key is pressed
void keyPressed() 
{
  switch(gameState)
  {
    case PLAYING:
      game.OnKeyPress();
      break;
  }
}

// fires when a key is released
void keyReleased()
{
  switch(gameState)
    {
      case PLAYING:
        game.OnKeyRelease();
        break;
    }
}

void DeltaTime()
{
  //calculates the time between frames to allow frame fluctuating 
  previousTime = newTime;
  newTime = millis();
  deltaTime = (newTime - previousTime) / 1000;
}

enum GAMESTATE
{
  MENU,
  PLAYING
}
