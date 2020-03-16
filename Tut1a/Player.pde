class Player
{
  int m_xPos = 0;
  int m_yPos = 0;
  int m_Width = 50;
  int m_Height = 40;
  int m_speed = 2;
  
  //0 == d 1 == a 2 == SPACE
  boolean[] m_buttons = new boolean[3];
  boolean m_shotFlag = false;
  
  ArrayList<Bullet> m_bullets = new ArrayList<Bullet>();  
  
  ArrayList<Enemy> enemies;
  ArrayList<Blocker> blockers;
  
  int m_bulletCount = 0;
  
  Player(ArrayList<Enemy> enemy,ArrayList<Blocker> blocks)
  {
    enemies = enemy;
    blockers = blocks;
    m_xPos = width / 2;
    m_yPos = height - m_Height - 10;
  }
  
  // Update Loop for the player
  void OnUpdate()
  {
    UpdateBullets();
    Movement();
  }
  
  void OnDraw()
  {
      rect(m_xPos,m_yPos,m_Width,m_Height);
      
      for(int i = 0; i < m_bulletCount; i++)
      {
        m_bullets.get(i).OnDraw();
      }
  }
  
  // Makes sure bullets get destroyed when moving off screen
  // Also if a bullet has been flagged to be destroyed
  void UpdateBullets()
  {
    for(int i = 0; i < m_bulletCount; i++)
    {
      m_bullets.get(i).OnUpdate();
      if(!m_bullets.get(i).m_isActive)
      {
        m_bullets.remove(i);
        m_bulletCount -= 1;
      }
    }
  }
  
  // Updates any movement based on keys being pressed
  void Movement()
  {
    for(int i = 0; i < m_buttons.length;++i)
    {
      if(m_buttons[i])
      {
        switch(i)
        {
          case 0:
            m_xPos += m_speed * deltaTime * 100;
            break;
          case 1:
            m_xPos -= m_speed * deltaTime * 75;
            break;
          case 2:
            if(m_shotFlag)
              return;
            
            m_shotFlag = true; 
            m_bullets.add(new Bullet(m_xPos,m_yPos,m_Width,OWNER.PLAYER,enemies,blockers));
            m_bulletCount += 1;
            break;
        }
      }
       // Stops player from moving off screen
      if((m_xPos + m_Width) > width)
        m_xPos -= m_speed;
      else if(m_xPos < 0)
        m_xPos += m_speed;
    }
  }
  
  void KeyPressed()
  {
    if(key == 'd')
    {
      m_buttons[0] = true;
    }
    
    if(key == 'a')
    {
      m_buttons[1] = true;
    }
    
    if(key == ' ' && !m_shotFlag) //<>// //<>//
    {
      m_buttons[2] = true;
    }
  }
  
  void KeyReleased()
  {
    if(key == 'd')
    {
      m_buttons[0] = false;
    }
    
    if(key == 'a')
    {
      m_buttons[1] = false;
    }
    if(key == ' ')
    {
      m_buttons[2] = false;
      m_shotFlag = false;
    }
  }
}
