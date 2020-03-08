Player player;
ArrayList<Enemy> enemies = new ArrayList<Enemy>();
float deltaTime = 0;
float previousTime = 0;
float newTime = 0;

int enemyWidth = 50;
int enemyHeight = 10;

void setup()
{
  size(1400,500);
  smooth();
  frameRate(60);
  player = new Player();
  
  EnemySpawn();
}

void draw()
{
  //calculates the time between frames to allow frame fluctuating 
  previousTime = newTime;
  newTime = millis();
  deltaTime = (newTime - previousTime) / 1000;
  
  clear();
  //background(0,255,0);
  
  for(int i = 0; i < enemies.size(); ++i)
  {
    Enemy enemy = enemies.get(i);
    
    if(player.m_xPos < enemy.m_xPos + enemy.m_width &&
       player.m_xPos + player.m_Width > enemy.m_xPos &&
       player.m_yPos < enemy.m_yPos + enemy.m_height &&
       player.m_yPos + player.m_Height > enemy.m_yPos)
       {
         print("yes");
       }
  }
  
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

void EnemySpawn()
{
  int x = 0;
  int row = 1;
  int rowSpacing = 50;
  for(int i = 0; i < 150; i++)
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


























/*
void myCircle()
{
  clear();
  ellipse(xPos,xPos,10,10);
  
  if(xPos >= height)
    flag = false;
  else if(xPos == 0)
    flag = true;
  
  if(flag)
    xPos += 1;
  else
    xPos -= 1;
}
*/


/*
void myLine()
{
  stroke(0,255,0);
  strokeWeight(5);
  line(50,0,50,300);
}
*/
