class Bullet
{
  int m_xPos = 0;
  int m_yPos = 0;
  int m_width = 10;
  int m_height = 10;
  boolean m_isActive = true;
  OWNER m_owner;
  
  ArrayList<Enemy> enemies;
  ArrayList<Blocker> blockers;
  Player player;
  
  Bullet(int x, int y, int myWidth, OWNER myOwner,
         ArrayList<Enemy> enemy,ArrayList<Blocker> blocks)
  {
    enemies = enemy;
    blockers = blocks;
    m_xPos = x + myWidth / 2 - (m_width / 2);
    m_yPos = y;
    m_owner = myOwner;
  }
  
  void OnUpdate()
  {
    switch(m_owner)
    {
      case PLAYER:
        EnemyCollision();
        break;
      case ENEMY:
        break;
    }

    for(Blocker block : blockers)
      block.CheckCollision(this);

    if(m_yPos <= 0 || m_yPos >= height)
      m_isActive = false;
  }
  
  void OnDraw()
  {
    switch(m_owner)
    {
      case PLAYER:
        m_yPos -= 3;
        break;
      case ENEMY:
        m_yPos += 3;
        break;
    }

    rect(m_xPos,m_yPos,m_width,m_height);
  }
  
  void EnemyCollision()
  {
    int count = 0;
    for(Enemy enemy : enemies)
    {
      if(m_xPos < enemy.m_xPos + enemy.m_width &&
       m_xPos + m_width > enemy.m_xPos &&
       m_yPos < enemy.m_yPos + enemy.m_height &&
       m_yPos + m_height > enemy.m_yPos)
       {
          enemies.remove(count);
          m_isActive = false;
          return;
       }
      count++;
       //line(enemy.m_xPos,enemy.m_yPos,m_xPos,m_yPos);
    }
  }
}

enum OWNER
{
  PLAYER,
  ENEMY
}
