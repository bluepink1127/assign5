class Brick{
   float x;
   float y;
   float len;
   float hei;
  
  void display(){
    fill(45,67,146);
    rectMode(CENTER);
    rect(x,y,50,30);
  } 
  Brick(float x,float y){
    this.x = x;
    this.y = y;
  }

}
