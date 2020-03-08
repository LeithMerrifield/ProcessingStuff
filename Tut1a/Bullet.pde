class Bullet
{
  int m_xPos = 0;
  int m_yPos = 0;
  int m_width = 10;
  int m_height = 10;
  boolean m_isActive = true;
  
  Bullet(int x, int y)
  {
    m_xPos = x + player.m_Width / 2 - (m_width / 2);
    m_yPos = y;
  }
  
  void OnUpdate()
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
  
  void OnDraw()
  {
    m_yPos -= 3;
    rect(m_xPos,m_yPos,m_width,m_height);
  }
}
