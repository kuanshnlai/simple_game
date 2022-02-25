
GameRegion gr;
ScoreBoard sb;
void setup(){
  size(600,800);
  gr = new GameRegion(600,700,0,100);
  sb = new ScoreBoard(600,100,0,0);
  noLoop();
}

void draw(){
  background(128);
  if(gr._start == false){
    gr.draw();
    sb.draw();
    gr.init();
  }
  else{
    gr.draw();
    sb.draw();
  }
  
}  
void keyPressed(){
  gr.processKeyEvent(keyCode);
  int score = gr._score;
  sb.updateScore(score);
  redraw();
}
void mousePressed(){
  gr.mousePressed();  
  redraw();
}
