Player player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
Blocker test;
float deltaTime = 0;
float previousTime = 0;
float newTime = 0;

boolean GameOver = false;
int enemyWidth = 50;
int enemyHeight = 10;
int enemyAmount = 30;

void setup()
{
  size(500,500);
  smooth();
  frameRate(60);
  player = new Player();
  test = new Blocker(width - 200,height - 200,100,50);
  EnemySpawn();
}

void draw()
{
  //calculates the time between frames to allow frame fluctuating 
  previousTime = newTime;
  newTime = millis();
  deltaTime = (newTime - previousTime) / 1000;
  
  clear();
  
  if(GameOver)
  {
    GameEnd();
    return;
  }
  
  EnemyShoot();
  
  for(int i = 0; i < enemies.size(); ++i)
  {
    Enemy enemy = enemies.get(i);
    
    if(player.m_xPos < enemy.m_xPos + enemy.m_width &&
       player.m_xPos + player.m_Width > enemy.m_xPos &&
       player.m_yPos < enemy.m_yPos + enemy.m_height &&
       player.m_yPos + player.m_Height > enemy.m_yPos)
       {
         GameOver = true;
         return;
       }
  }
  
  test.OnDraw();
  for(Enemy enemy : enemies)
  {
      enemy.OnUpdate();
  }
  
  player.OnUpdate();
  
  for(Enemy enemy : enemies)
  {
      enemy.OnDraw();
  }
  
  player.OnDraw();
  //println(deltaTime);
}

void keyPressed() 
{
  player.KeyPressed();
  ChangeEnemySpeed();
}

void keyReleased()
{
  player.KeyReleased();
}

void EnemyShoot()
{
  for(Enemy enemy : enemies)
  {
    if(enemy.m_yPos == enemies.get(enemies.size() - 1).m_yPos)
    {
      enemy.Shoot();
    }
  }
}

void GameEnd()
{
  String endText = "GAME OVER";
  textSize(32);
  textAlign(CENTER,CENTER);
  text(endText,width / 2,height / 2);
}

void EnemySpawn()
{
  int x = 0;
  int row = 1;
  int rowSpacing = 50;
  for(int i = 0; i < enemyAmount; i++)
  {

    if(!(row % 2 == 0))
    {
      if(x * 60 + enemyWidth < width)
      {
        Enemy row1 = new Enemy((x * 60), (row - 1) * rowSpacing, enemyWidth, enemyHeight);
        enemies.add(row1);
      }
      else
      {
        row++;
        x = 0;
      }
      x++;
    }
    else
    {
      if(width - x * 60 - enemyWidth  > 0)
      {
        Enemy row1 = new Enemy(width - (x * 60) - enemyWidth, (row - 1) * rowSpacing, enemyWidth, enemyHeight);
        row1.m_state = ENEMYSTATE.LEFT;
        enemies.add(row1);
      }
      else
      {
        x = 0;
        row++;
      }
      x++;
    }
  }
}

void ChangeEnemySpeed()
{
  int flag = 0;
  if(keyCode == 33)
    flag = 1;
  else if (keyCode == 34)
    flag = 2;
  
  if(flag != 0)
  {
    for(int i = 0; i < enemies.size(); i++)
    {
      if(flag == 1)
        enemies.get(i).ChangeSpeed(0.5f);
      else
        enemies.get(i).ChangeSpeed(-0.5f);
      
    }
  }
}
