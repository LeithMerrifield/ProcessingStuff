class Game
{
  boolean entryFlag = false;
  Player player;
  ArrayList<Enemy> enemies = new ArrayList<Enemy>();
  ArrayList<Blocker> blockers = new ArrayList<Blocker>();
  
  boolean isGameOver = false;
  boolean isGameWin = false;
  int enemyWidth = 50;
  int enemyHeight = 10;
  int enemyAmount = 90;
  int blockerAmount = 5;
  
  void OnEntry()
  {
    player = new Player(enemies,blockers);
    BlockerSpawn();
    EnemySpawn();
    entryFlag = true;
  }
  
  void OnUpdate()
  {
    if(GameOverCheck())
      return;
    
    EnemyShoot();

    //Update Phase
    for(Enemy enemy : enemies)
        enemy.OnUpdate();
    
    player.OnUpdate();
  }
  
  void OnDraw()
  {
    // Drawing Phase
    for(Enemy enemy : enemies)
    {
        enemy.OnDraw();
    }
    
    for(Blocker block : blockers)
    {
      block.OnDraw();
    }
    
    player.OnDraw();
  }
  
  void OnKeyPress()
  {
    player.KeyPressed();
    ChangeEnemySpeed();  
  }
  
  void OnKeyRelease()
  {
    player.KeyReleased();
  }
  
  boolean GameOverCheck()
  {
    if(isGameOver)
    {
      GameEnd("GAME OVER");
      return true;
    }
    else if(isGameWin)
    {
      GameEnd("WINNER!");
      return true;
    }
  
    for(int i = 0; i < enemies.size(); ++i)
    {
      Enemy enemy = enemies.get(i);
      
      if(player.m_xPos < enemy.m_xPos + enemy.m_width &&
         player.m_xPos + player.m_Width > enemy.m_xPos &&
         player.m_yPos < enemy.m_yPos + enemy.m_height &&
         player.m_yPos + player.m_Height > enemy.m_yPos)
         {
           isGameOver = true;
           return true;
         }
    }
    
    if(enemies.size() <= 0)
    {
      isGameWin = true;
    }
    return false;
  }
  
  // if the player dies or Wins
  void GameEnd(String text)
  {
    textSize(32);
    textAlign(CENTER,CENTER);
    text(text,width / 2,height / 2);
  }

  
  // enemy spawning that scales with screen size
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
          Enemy row1 = new Enemy((x * 60), (row - 1) * rowSpacing, enemyWidth, enemyHeight,enemies,blockers);
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
          Enemy row1 = new Enemy(width - (x * 60) - enemyWidth, (row - 1) * rowSpacing, enemyWidth, enemyHeight,enemies,blockers);
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
  
  void BlockerSpawn()
  {
    int offset = 200;
    
    for(int i = 0; i < blockerAmount; i++)
    {
      blockers.add(new Blocker(10 + offset * i, height - 200, 100,50));
    }
  }
  
  // #TODO needs to configured to shoot if the space below is empty
  void EnemyShoot()
  {
    for(Enemy enemy : enemies)
    {
      boolean flag = false;
      for(Enemy enemy2 : enemies)
      {
        if(enemy == enemy2)
          continue;
        else if(flag)
          break;
        
        if(!(enemy.m_xPos < enemy2.m_xPos + enemy2.m_width + 20 &&
           enemy.m_xPos + enemy.m_width + 20 < enemy2.m_xPos))
           {
             if(enemy.m_yPos > enemy2.m_yPos)
               flag = true;
           }
      }
      if(!flag)
        enemy.Shoot();
      
      /*if(enemy.m_yPos == enemies.get(enemies.size() - 1).m_yPos)
      {
        enemy.Shoot();
      }*/
    }
  }
}
