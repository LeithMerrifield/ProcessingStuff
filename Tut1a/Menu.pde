class Menu
{
  ArrayList<Button> buttons = new ArrayList<Button>();
  boolean entryFlag = false;
  int buttonOffset = 70;
  Vector3 titlePosition = new Vector3(width / 2, 100);
  
  void OnEntry()
  {
    int dstFromTitle = 20;
    
    buttons.add(new Button(width / 2, (titlePosition.y + dstFromTitle) + 
                buttonOffset, "Play", BUTTONTAG.PLAY));
    buttons.add(new Button(width / 2, (titlePosition.y + dstFromTitle) + 
                buttonOffset * 2, "Settings", BUTTONTAG.SETTINGS));
    buttons.add(new Button(width / 2, (titlePosition.y + dstFromTitle) + 
                buttonOffset * 3, "Quit", BUTTONTAG.QUIT));
                
    entryFlag = true;
  }
  
  void OnUpdate()
  {
    for(Button button : buttons)
    {
      button.CheckCollision();
      if(button.m_isClicked)
      {
        switch(button.m_tag)
        {
          case PLAY:
            gameState = GAMESTATE.PLAYING;
            break;
          case SETTINGS:
            break;
          case QUIT:
            exit();
            break;
        }
      }
    }
  }
  
  void OnDraw()
  {
    Title();
    
    for(Button button : buttons)
    {
      button.OnDraw();
    }
  }
  
  void Title()
  {
    fill(0,255,0);
    textSize(64);
    String text = "Space Invaders";
    textAlign(CENTER,TOP);
    text(text,titlePosition.x,titlePosition.y);
    fill(255,255,255);
    textSize(32);
  }
}
