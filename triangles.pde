Triangle t;
float x,y,last_time=0,padding=10, slope,orig_x,orig_y,rand_x,rand_y;
boolean isMobile,reached=false,finished=false; 
point randpoint;
void setup() {
  size(1000, 400);
  smooth();
  var uagent = navigator.userAgent.toLowerCase();
  if (navigator.userAgent.match(/iPad|iPhone|iPod/i) != null)
      isMobile = true;
   else
      isMobile = false;
 
  t = new Triangle(width, height+100, width/2, height, 0, height+100);
  orig_x=width/2;
  orig_y=height;
  x=orig_x;
  y=orig_y;
  generate_random_point();
}
 

void generate_random_point(){
	rand_x=random(0,width);
	rand_y=random(0,height);
	randpoint = point(rand_x,rand_y);
	slope = (rand_y-orig_y)/(rand_x-orig_x);
} 

void draw() {
	if(isMobile){

	if(y<rand_y){
		generate_random_point();
		x=orig_x;
		y=orig_y;
	}
	if(rand_x>x){
		x+=random(2, 7);
	}else{
		x-=random(2, 7);
	}
	y=(slope*(x-(width/2)))+height;

	checkCollision(x,y,t);


	}else{
		document.onmousemove = function(e) {
        if(mouseX!=0){
	  		 drawTriangles(mouseX, mouseY, t);
        }
	  	} 
	}
}
 
class Triangle {
  float point1x;
  float point1y;
  float point2x;
  float point2y;
  float point3x;
  float point3y;
 
  Triangle(float point1x, float point1y, float point2x, float point2y, float point3x, float point3y) {
    this.point1x = point1x;
    this.point1y = point1y;
    this.point2x = point2x;
    this.point2y = point2y;
    this.point3x = point3x;
    this.point3y = point3y;
  }
 
  void drawTriangle() {
    triangle(point1x, point1y, point2x, point2y, point3x, point3y);
  }
}
 
void drawTriangles(float x, float y, Triangle t) {
  noStroke();
  fill(#FF7D7D, 50);
  triangle(x, y, t.point2x, t.point2y, t.point3x, t.point3y);
  fill(#4A5F5F, 50);
  triangle(x, y, t.point3x, t.point3y, t.point1x, t.point1y);
  fill(#7DFDFE, 50);
  triangle(x, y, t.point2x, t.point2y, t.point1x, t.point1y);
}
 
