/*
int num = 5;
int[] integers = new int[20];
float[] mahNumbers = new float[100];
String[] mahStrings = new String[15];

// Question 2 = a,d,e

int[] moreNumbers = new int[100];

for(int i = 0; i < moreNumbers.length; i++)
{
  moreNumbers[i] = i;
}

int[] nums = {5,4,2,7,6,8,5,2,8,14};

for(int i = 0; i < nums.length; i++)
{
  //4.a
  nums[i] *= nums[i];
  println(nums[i]);
  
  //4.b
  nums[i] += random(0,10);
  

}

for(int i = 0; i < nums.length; i++)
{
  //4.c
  if(i != nums.length - 1)
  {
    nums[i] += nums[i+1];
  }
}

// 4.d
  int sum = 0;

for(int i = 0; i < nums.length; i++)
{
  sum += nums[i]; 
}
println("Sum = " + sum);

// 4.e
int average = sum / nums.length;
print("Average = " + average);
*/

/*
//5
size(200,200);
background(255);
stroke(0);

for(int i = 0; i < 11;  i++)
{
  line(50 + (i * 10),60,50 + (i * 10), 80);
}
*/

/*
//6
size(800,800);
boolean flag = true;
int counter = 0;

while(flag)
{
  if(counter * 10 >= height)
    flag = false;
    
  line(0,counter * 10, width, counter * 10);
  counter++;
}
*/


/* 6b
void setup()
{
  size(1000,1000);
}


void draw()
{
  int loops = width / 10;
  for(int i = loops ; i > 0;i--)
  {
    fill(random(0,255),random(0,255),random(0,255));
    ellipse(width / 2,height / 2, i * 10,i * 10);
  }
}

void setup()
{
  size(1000,1000);
  frameRate(60);
}

void draw()
{
  int size = 10;
  int widthLoops = width / size;
  int heightLoops = height / size;
  
  for(int i = 0; i < widthLoops;i++)
  {
    for(int x = 1; x < heightLoops; x++)
    {
      fill(random(0,255),random(0,255),random(0,255));
      rect(size * i, size * x,size,size);
    }
  }
}
*/



int x = 0;
int speed = 1;

void setup() {
  size(200,200);
  smooth();
}
void draw() {
  background(255);
  move();
  bounce();
  display();
}

void move()
{
    x = x + speed;
}

void bounce()
{
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
  }
}

void display()
{
    // Display circle at x location
  stroke(0);
  fill(175);
  ellipse(x,100,32,32);
}
