class Character
{
  
  float m_xPos;
  float m_yPos;
  
  Character()
  {
    m_speed = 5.0f;
    m_xPos = width / 2;
    m_yPos = height / 2;
  }
  
  public float m_speed;
  
  void OnUpdate()
  {
    if(key == 'd')
    {
      m_xPos += 1;
    }
  }
  
  void OnDraw()
  {
    rect(m_xPos,m_yPos,10,10);
  }
}
