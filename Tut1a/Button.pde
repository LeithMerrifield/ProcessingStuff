class Button
{
  Vector3 m_position = new Vector3();
  int m_width = 200;
  int m_height = 60;
  boolean m_isClicked = false;
  BUTTONSTATE m_buttonState = BUTTONSTATE.IDLE;
  String m_buttonText = "Test";
  BUTTONTAG m_tag;
  
  Button(float x, float y,String text,BUTTONTAG tag)
  {
    m_position.x = x - m_width / 2;
    m_position.y = y;
    m_buttonText = text;
    m_tag = tag;
  }
  
  void OnDraw()
  {
    switch(m_buttonState)
    {
      case IDLE:
        fill(255);
        break;
      case HOVER:
        fill(200);
        break;
    }
    
    rect(m_position.x,m_position.y,m_width,m_height);
    fill(0,0,0);
    textAlign(CENTER,CENTER);
    text(m_buttonText,m_position.x + m_width / 2,m_position.y + m_height / 2);
    fill(255,255,255);
  }
  
  void CheckCollision()
  {
    
    if(mouseX < m_position.x + m_width &&
    mouseX > m_position.x &&
    mouseY < m_position.y + m_height &&
    mouseY > m_position.y)
    {
      m_buttonState = BUTTONSTATE.HOVER;
      if(mousePressed)
        m_isClicked = true;
    }
    else
    {
      m_buttonState = BUTTONSTATE.IDLE;
    }
  }
}

enum BUTTONSTATE
{
  IDLE,
  HOVER
}

enum BUTTONTAG
{
  PLAY,
  SETTINGS,
  QUIT
}
