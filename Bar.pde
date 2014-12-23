class Bar{
  float x;
  float y;
  float len;
  
  void move(){
    x = mouseX;
  }
  void display(){
        fill(255);
    rectMode(CENTER);
    rect(x,y,len,10);
  }
  
  Bar(float len){
    this.x = width/2;
    this.y = height-40;
    this.len = len;
  }
}
