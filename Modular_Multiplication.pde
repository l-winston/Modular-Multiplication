int n = 100;
float mult;
float r, a;

void setup() {
  fullScreen();
  //size(500, 500);
  r = min(width, height)/2f - 10;
  a = TWO_PI/n;
  mult = 2;
  print(r + " " + a);
}

void draw() {
  translate(width/2, height/2);
  rotate(PI);
  
  background(0);
  colorMode(HSB, 100);
  stroke(((frameCount/10f)%100), 100, 100);
  a = TWO_PI/n;
  
  for (int i = 0; i < n; i++) {
    
    strokeWeight(5);
    PVector point = getPoint(i);
    point(point.x, point.y);
    
    strokeWeight(1);
    PVector other = getPoint((i*mult)%n);
    line(point.x, point.y, other.x, other.y);
    
    PVector next = getPoint(i+1);
    line(point.x, point.y, next.x, next.y);
  }
  
  mult+=0.02;
}

PVector getPoint(float n){
   return new PVector(r*cos(n*a), r*sin(n*a));
}
