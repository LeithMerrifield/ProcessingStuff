class Blocker
{
  int m_width;
  int m_height;
  int m_divisionAmountX;
  int m_divisionAmountY;
  int m_blockSize = 10;
  Vector3 m_colour = new Vector3(100,100,100);
  Vector3 m_position = new Vector3();
  ArrayList<Block> m_blocks = new ArrayList<Block>();
  
  Blocker(int x, int y, int myWidth,int myHeight)
  {
    m_height = myHeight;
    m_width = myWidth;
    
    m_position.x = x;
    m_position.y = y;
    
    m_divisionAmountX = m_width / m_blockSize;
    m_divisionAmountY = m_height / m_blockSize;
    
    for(int i = 0; i < m_divisionAmountX; i++)
    {
      for(int j = 0; j < m_divisionAmountY; j++)
      {
        m_blocks.add(new Block(m_position.x + i * m_blockSize,m_position.y + j * m_blockSize, m_blockSize));
      }
    }
  }
  
  void OnDraw()
  {
    for(Block block : m_blocks)
    {
      block.OnDraw();
    }
  }
  
  void CheckCollision(Bullet bullet)
  {
    int counter = 0;
    for(Block block : m_blocks)
    {
       if(block.m_position.x < bullet.m_xPos + bullet.m_width &&
       block.m_position.x + block.m_radius > bullet.m_xPos &&
       block.m_position.y < bullet.m_yPos + bullet.m_height &&
       block.m_position.y + block.m_radius > bullet.m_yPos)
       {
         m_blocks.remove(counter);
         bullet.m_isActive = false;
         return;
       }
       counter++;
    }
  }
}

class Block
{
  Vector3 m_position = new Vector3();
  boolean m_isAlive;
  int m_radius;
  
  Block(float x, float y, int size)
  {
    m_position.x = x;
    m_position.y = y;
    m_radius = size;
  }
  
  void OnDraw()
  {
    rect(m_position.x,m_position.y, m_radius,m_radius);
  }
}
