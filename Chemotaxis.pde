// Bacteria class
class Bacteria {
  var myX, myY;
  var myColor, textColor;

  Bacteria() {
    myX = 250;
    myY = 500;
    myColor = color(random(56, 256), random(56, 256), random(56, 256));
    textColor = color(255);
  }

  void walk() {
    if (mouseX > myX) {
      myX = myX + floor(random(7)) - 1;
    } else {
      myX = myX + floor(random(7)) - 5;
    }

    if (mouseY > myY) {
      myY = myY + floor(random(7)) - 1;
    } else {
      myY = myY + floor(random(7)) - 5;
    }

    if (mouseX == myX && mouseY == myY) {
      textSize(30);
      textColor = color(255, 255, 255);
      fill(textColor);
      text("You Lose", 190, 250);
      text("You scored: " + points + " points", 100, 280);
      noLoop();
    }
  }

  void show() {
    fill(myColor);
    ellipse(myX, myY, 20, 20);
    noFill();
  }
}

// Point class
class Point {
  var myX, myY;

  Point(x, y) {
    myX = x;
    myY = y;
  }

  void show() {
    fill(255, 0, 0);
    rect(myX, myY, 30, 30);
    noFill();
    textSize(10);
    fill(255, 255, 255);
    text("Points: " + points, 420, 50);
  }

  void deletes() {
    myX = 800;
    myY = 800;
  }

  void back() {
    myX = random(50, 450);
    myY = random(50, 450);
  }
}

// Main sketch
var gross = [];
for (var i = 0; i < 50; i++) {
  gross.push(new Bacteria());
}

var deletePoint = new Point(random(50, 450), random(50, 450));
var points = 0;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  deletePoint.show();

  for (var i = 0; i < gross.length; i++) {
    gross[i].walk();
    gross[i].show();
  }

  if (mouseX <= deletePoint.myX + 20 && mouseX >= deletePoint.myX + 10 &&
      mouseY <= deletePoint.myY + 20 && mouseY >= deletePoint.myY + 10) {
    deletePoint.deletes();
    points += 1;
    deletePoint.back();
    deletePoint.show();
  }
}
