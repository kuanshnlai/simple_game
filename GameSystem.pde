
class GameRegion{
  int _width;
  int _height;
  int _x;
  int _y;
  int _gap;
  int _rolePosX;
  int _rolePosY;
  int _appleX;
  int _appleY;
  int _score;
  boolean _start = false;
  GameRegion(int w,int h,int x,int y){
    _width = w;
    _height = h;
    _x = x;
    _y = y;
    _gap = 20;
    _rolePosX = (_width+_x)/2;
    _rolePosY = (_height+_y)/2;
    _appleX = _rolePosX;
    _appleY = _rolePosY;
    
    putApple();
    _score = 0;
  }
  void init(){
      fill(170,170,170,200);
      int x = _x+_width/4;
      int y = _y+_height/4;
      rect(x,y,_width/2,_height/2);
      textSize(15);
      textAlign(LEFT);
      fill(255,0,0);
      text("Game Intro",x+_width/8,y+30);
      //text("遊戲介紹:",x+_width/8,y+30);
      text("Red point means apple",x+30,y+70);
      //text("紅點表示得分點",x+30,y+70);
      text("Black point means the character",x+30,y+115);
      //text("黑點表示角色",x+30,y+115);
      text("Please using direction key to move",x+30,y+160);
      textAlign(CENTER);
      //text("按下滑鼠以開始遊戲",x+_width/4,y+_height/2-30);
      text("Click to start",x+_width/4,y+_height/2-30);
  }
  void mousePressed(){
      println("mouse press");
     if(_start == false){
       println("start == false");
       _start = true; 
     }

  }  
  void draw(){
    //background(255,255,255);
    fill(255,255,255);
    rect(_x,_y,_width,_height);
    
    //fill(128,0,0);
    for(int  i=0;i<_width;i+=_gap){
      line(i+_x,_y,i+_x,_y+_height);  
    }
    for(int i=0;i<_height;i+=_gap){
       line(_x,i+_y,_x+_width,i+_y); 
    }
    fill(0,0,0);
    square(_rolePosX,_rolePosY,_gap);
    fill(255,0,0);
    square(_appleX,_appleY,_gap);
  }
  void processKeyEvent(int _keyCode){
    if(_start == false){
      return;
    }
    if(_keyCode == UP && !isBound(_rolePosX,_rolePosY-_gap)){
      _rolePosY-=_gap;
    }
    else if(_keyCode == DOWN && !isBound(_rolePosX,_rolePosY+_gap)){
       _rolePosY+=_gap; 
    } 
    else if(_keyCode == RIGHT&& !isBound(_rolePosX+_gap,_rolePosY)){
      _rolePosX+=_gap;
    }
    else if(_keyCode == LEFT&& !isBound(_rolePosX-_gap,_rolePosY)){
      _rolePosX-=_gap;
    }
    if(eatApple()){
      _score+=1;
      putApple();
    }
  }
  boolean isBound(int x,int y){
    return x<_x||x>=_x+_width||y<_y||y>=_y+_height;
  }
  boolean eatApple(){
    return _rolePosX == _appleX && _rolePosY == _appleY;  
  }
  void putApple(){
    do{
      _appleX = int(random(_width/_gap))*_gap+_x;
      _appleY = int(random(_width/_gap))*_gap+_y;
    }while(_appleX==_rolePosX&&_appleY==_rolePosY);
    
  }
}
class ScoreBoard{
  int _x;
  int _y;
  int _width;
  int _height;
  int _score;
  ScoreBoard(int w,int h,int x,int y){
    _x = x;
    _y = y;
    _width = w;
    _height = h;
  }
  void draw(){
    fill(0,0,0);
    rect(_x,_y,_width,_height);
    fill(255,0,0);
    textSize(50);
    textAlign(CENTER,CENTER);
    text("Score : "+str(_score),_x+_width/2,_y+_height/2);
  } 
  void updateScore(int score){
      _score = score;
  }
}
