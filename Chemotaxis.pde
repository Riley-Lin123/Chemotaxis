class Bacteria {
 int myX, myY, myColor, textColor;
 Bacteria (){
   myX = 250;
   myY = 500;
   myColor = color((int)(Math.random()*200)+56,(int)(Math.random()*200)+56,(int)(Math.random()*200)+56);
   textColor = color(255);
}//end of constructor

 void walk(){
   
   if (mouseX > myX) {
     myX = myX + (int)(Math.random()*7)-1;
   } else {
     myX = myX + (int)(Math.random()*7)-5;
   }
   if (mouseY > myY) {
     myY = myY + (int)(Math.random()*7)-1;
   } else {
     myY = myY + (int)(Math.random()*7)-5;
   }
   if (mouseX == myX && mouseY == myY) {
     textSize(30);
     textColor = color(255,255,255);
     fill(textColor);
     text("You Lose", 190,250);
     text("You scored: " + points + " points",100,280);
     noLoop();
     
   }
}//end of walk member function

void show(){
  fill(myColor);
  ellipse(myX,myY,20,20);
  noFill();
}//end of function member show
}//end of Bacteria class

class Point {
  int myX, myY;
  
  Point(int x, int y){
    myX = x;
    myY = y;
  }//end of constructor
  void show(){
    fill(255,0,0);
    rect(myX, myY, 30,30);
    noFill();
    textSize(10);
    fill(255,255,255);
    text("Points: " + points, 420,50);
  }//end of member function show
  void deletes(){
    myX = 800;
    myY = 800;
  }
  void back(){
    myX = (int)(Math.random()*400+50);
    myY = (int)(Math.random()*400+50);
  }
}//end of Power class





Bacteria [] gross = new Bacteria[50];
Point delete = new Point((int)(Math.random()*400+50),(int)(Math.random()*400+50));
int points = 0;

void setup(){
  size(500,500);
  for (int i = 0; i < gross.length; i++){
    gross[i] = new Bacteria();
  }
}//end of setup function

void draw(){
  background(0);
  delete.show();
  for (int i = 0; i < gross.length; i++){
    gross[i].walk();
    gross[i].show();
  }
  if (mouseX <= delete.myX + 20 && mouseX >= delete.myX + 10 && mouseY <= delete.myY + 20 && mouseY >= delete.myY +10){
      delete.deletes();
      points = points + 1;
      delete.back();
      delete.show();
}
}//end of draw function
