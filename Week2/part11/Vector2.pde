static class Vector2
{
  Vector2(int X,int Y)
  {
    x = X;
    y = Y;
  }
  
  float mag()
  {
    return sqrt(x * x + y * y);
  }
  
  // takes two vector3s and minuses them returning a new vector
  static Vector2 sub(Vector2 vector1, Vector2 vector2)
  {
    return new Vector2(vector1.x - vector2.x,
                       vector1.y - vector2.y);
  }
  
  
  int x;
  int y;
}
