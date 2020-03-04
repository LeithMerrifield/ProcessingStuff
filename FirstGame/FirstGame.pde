Character player;

void setup()
{
  size(500,500);
  frameRate(60);
  player = new Character();
}

// have split the game loop into update and draw for readability and a bit of structure
void draw()
{
  Update();
  Draw();
}

//Will update inputs/positions/physics before drawing happens
void Update()
{
  Settings.OnUpdate();
  player.OnUpdate();
}

//Draw that happens every frame after update
void Draw()
{
  background(42,81,82);
  player.OnDraw();
}
