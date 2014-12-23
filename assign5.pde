
Ball balls;
Bar board;
Brick [] bricks;


final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_WIN     = 2;
final int GAME_LOSE    = 3;
int status;              //Game Status
int point;   




String pStart = "PONG GAME";
String sStart = "Press Enter to Start";
String pPause = "Pause";
String sPause = "Press Enter to Resume";
String pWin   = "WINNER";
String sWin   = "SCORE";
String pLose  = "BOOM";
String sLose  = "You are dead!";

void printText(
int pSize, int px, int py, String pMark, String sMark) {  
  textSize(pSize);
  text(pMark, px, py);
  fill(95, 194, 226);
  textSize(20);
  text(sMark, px, py+40);
  fill(95, 194, 226);
  textAlign(CENTER);
}



void setup(){
  size(640,480);
  balls = new Ball(10,3);
  board = new Bar(100);
  bricks = new Brick[40];  

 

  int i=0;
  int ix=95;
  int iy=40;  
  for (int row =0; row < 5; row++) {
   for (int col = 0; col < 8; col++) {  
      int x = ix + col * 65;
      int y = iy + row * 40;
      bricks[i]= new Brick(x, y);
      i++;
      if(i==40){
      break;
      }
    }
  }
}
void draw(){
  background(0);
  noStroke();
  
  switch(status) {
   
    case GAME_START:
      printText(60, width/2, height/2, pStart, sStart);
 
    break;
    
    case GAME_PLAYING:
      board.display();
      balls.display(); 
      for (int i=0; i<=bricks.length-1; i++){
        bricks[i].display();
      }

      drawLife();
      ballLife(3);
      mouseClicked();
        
        
        
     break;
     
    case GAME_WIN:
      printText(40, width/2, height/2+80, pWin, sWin+":"+point);
    break;

    case GAME_LOSE:
      fill(95, 194, 226);
      printText(40, width/2, height/2, pLose, sLose);

    break;    
 }
}


void drawLife() {
  fill(230, 74, 96);
  text("LIFE:", 36, 465);
}

void ballLife(int Life) {

  for (int i=0; i<balls.life; i++) {
    fill(230, 74, 96);
    ellipse(78+i*25, 459, 15, 15);
    ellipseMode(CENTER);
  }
}

void keyPressed() {

  statusCtrl();
}

/*----------- statusCtrl--------*/
void mouseClicked() {


     board.move();
     balls.move(); 
   
      
}
        
void statusCtrl() {
  if (key == ENTER) {
    switch(status) {

    case GAME_START:
      status = GAME_PLAYING;
      break;
      
    case GAME_WIN:
      status = GAME_PLAYING;
      reset();
      break;
      
    case GAME_LOSE:
      status = GAME_PLAYING;
      reset();
      break;
    }
  }
}

/*---------Reset Game-------------*/
void reset() {
  ballLife(3);
}
