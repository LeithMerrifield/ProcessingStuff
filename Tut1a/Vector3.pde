/*
  Auther: Leith Merrifeld
  Description: My Vector3 class, originally meant so i could overload
               operators but turns out you can't in java like you can
               c++
  Date: 9/03/2020
  Modified: 9/03/20
*/

static class Vector3
{
  float x,y,z;
  
  // creates an identity vector3
  Vector3()
  {
    x = 0;
    y = 0;
    z = 0;
  }
  
  // basic constructor
  Vector3(float x, float y, float z)
  {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  Vector3(float x, float y)
  {
    this.x = x;
    this.y = y;
    this.z = 0;
  }
  
  // adds another vector3 to this one
  void add(Vector3 other)
  {
    x += other.x;
    y += other.y;
    z += other.z;
  }
  
  // will take in two vector3's and return the sum
  static Vector3 add(Vector3 vector1,Vector3 vector2)
  {
    return new Vector3(vector1.x + vector2.x,
                       vector1.y + vector2.y,
                       vector1.z + vector2.z);
  }
  
  // multiplies the vector3 by a float
  void mult(float scalar)
  {
    x *= scalar;
    y *= scalar;
    z *= scalar;
  }
  
  // subtacts a vector3 from this one
  void sub(Vector3 other)
  {
    x -= other.x;
    y -= other.y;
    z -= other.z;
  }
  
  // takes two vector3s and minuses them returning a new vector
  static Vector3 sub(Vector3 vector1, Vector3 vector2)
  {
    return new Vector3(vector1.x - vector2.x,
                       vector1.y - vector2.y,
                       vector1.z - vector2.z);
  }
  
  // calculates the magnitude of the vector3
  float mag()
  {
    return sqrt(x * x + y * y + z * z);
  }
  
  // normalises the vector to a value from 0 - 1
  void normalise()
  {
    float mag = mag();
    x /= mag;
    y /= mag;
    z /= mag;
  }
  
}
