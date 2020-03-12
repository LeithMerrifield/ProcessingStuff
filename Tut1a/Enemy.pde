class Enemy
{
  float m_xPos = 0;
  float m_yPos = 0;
  
  int m_width = 40;
  int m_height = 10;
  float m_speed = .5f;
  
  float m_previousYPos;
  float m_downAmount = 50.0f;
  
  ENEMYSTATE m_state = ENEMYSTATE.RIGHT;
  ENEMYSTATE m_previousState;
  int m_row = 0;
  
  ArrayList<Bullet> m_bullets = new ArrayList<Bullet>();
  int m_bulletCount = 0;
    
  boolean m_directionFlag = false;
  
  Enemy(int x, int y, int newWidth, int newHeight)
  {
    m_xPos = x;
    m_yPos = y;
    m_width = newWidth;
    m_height = newHeight;
  }
  
  void OnUpdate()
  {
    UpdateBullets();
    BoundaryCheck();
    Movement();
  }
  
  void OnDraw()
  {
    rect(m_xPos + (m_width / 2) / 2, m_yPos - m_height /2,m_width / 2,m_height / 2);
    rect(m_xPos, m_yPos,m_width,m_height);
    
    for(int i = 0; i < m_bulletCount; i++)
    {
      m_bullets.get(i).OnDraw();
    }
  }
  
  void Movement()
  {
    if(m_state == ENEMYSTATE.DOWN)
    {
      if(m_yPos - m_previousYPos <= m_downAmount)
      {
        m_yPos += m_speed * deltaTime * 100;
      }
      else
      {
        m_yPos = m_previousYPos + m_downAmount;
        if(m_previousState == ENEMYSTATE.RIGHT)
        {
          m_previousState = ENEMYSTATE.DOWN;
          m_state = ENEMYSTATE.LEFT;
        }
        else
        {
          m_previousState = ENEMYSTATE.DOWN;
          m_state = ENEMYSTATE.RIGHT;
        }
      }
    }
    
    else if(m_state == ENEMYSTATE.RIGHT)
      m_xPos += m_speed * deltaTime * 100;
    else if(m_state == ENEMYSTATE.LEFT)
      m_xPos -= m_speed * deltaTime * 100;
  }
  
  void BoundaryCheck()
  {
    if((m_xPos + m_width) >= width && m_state != ENEMYSTATE.DOWN && m_state != ENEMYSTATE.LEFT)
    {
      m_previousState = m_state;
      m_row++;
      m_state = ENEMYSTATE.DOWN;
      m_previousYPos = m_yPos;
    }
    else if(m_xPos < 0 && m_state != ENEMYSTATE.DOWN  && m_state != ENEMYSTATE.RIGHT)
    {
       m_previousState = m_state;
       m_row++;
       m_state = ENEMYSTATE.DOWN;
       m_previousYPos = m_yPos;
    }
  }
  
  void ChangeSpeed(float speed)
  {
    m_speed += speed;
    if(m_speed < 0.0f)
    {
      m_speed = 0.0f;
    }
  }
  
  void Shoot()
  {
    m_bullets.add(new Bullet((int)m_xPos,(int)m_yPos,OWNER.ENEMY));
    m_bulletCount += 1;
  }
  
  // Makes sure bullets get destroyed when moving off screen
  // Also if a bullet has been flagged to be destroyed
  void UpdateBullets()
  {
    for(int i = 0; i < m_bulletCount; i++)
    {
      m_bullets.get(i).OnUpdate();
      if(m_bullets.get(i).m_yPos >= height || !m_bullets.get(i).m_isActive)
      {
        m_bullets.remove(i);
        m_bulletCount -= 1;
      }
    }
  }
}

enum ENEMYSTATE
{
  RIGHT,
  LEFT,
  DOWN
}
