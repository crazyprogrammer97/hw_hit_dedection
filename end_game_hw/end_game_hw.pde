import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Sound for hit
Minim minim;
AudioPlayer player;

float x = 0;
float y = 0;
float dx = 2;
float dy = 2;

float accx = 3;
float accy =3;

float bw = 150;
float bh = 30;
String bTxt = "START";
String rTxt="Restart";
float radEnemy = 30;

Boolean scene1 = true;
Boolean scene2 = false;
Boolean scene3 = false;
Boolean scene4=false;
// parameters for robot
float rw = 45;
float rh = 153;

void setup() {
  size(600, 600);


setupSound();
}

void setupSound() {

  // instantiate lib and load sound to play
  minim = new Minim(this);
  player = minim.loadFile("eren.mp3");
}


void draw() {
  background(255);

  if (scene2 == true) {
    // draw robot
    drawMycustomRobot(mouseX, mouseY, 52, 152, 219);

    x = x+accx*dx;
    y = y +accy*dy;

    if (x > width || x < 0)
    {
      accx = random(0.1, 5);
      dx = dx*-1;
    }

    if ( y > height || y < 0) {
      accy = random(0.1, 5);
      dy = dy*-1;
    }



    fill(0);
    noStroke();
    ellipse(x, y, radEnemy, radEnemy);

    // Check hit detection with robot and enemy ball
    if (mouseX + rw/2 > x-radEnemy/2 && mouseX - rw/2 < x + radEnemy/2
      && mouseY + rh/2> y - radEnemy/2 && mouseY - rh/2 < y + radEnemy/2) {
      scene3 = true;
      scene1 = false;
      scene2 = false;

      /// Play preloaded sound when it hits 
  
    player.rewind();
      player.play();
  
  
    }
  }

  if (scene1 == true) {
    startButton();
  }

  // Scene 3 content
  if (scene3 == true) {
    fill(255, 0, 0, 150);
    rect(0, 0, width, height);
    restartButton();
  }
}

void restartButton(){
  pushMatrix();
  translate(width/2 - bw/2, height/2 - bh/2);
  fill(#2ECC71);


  noStroke();
  rect(0, 0, bw, bh);

  fill(255);
  text(rTxt, bw/2 - textWidth(rTxt)/2, 18 );
  popMatrix();
}
void startButton() {
  pushMatrix();
  translate(width/2 - bw/2, height/2 - bh/2);
  fill(#2ECC71);


  noStroke();
  rect(0, 0, bw, bh);

  fill(255);
  text(bTxt, bw/2 - textWidth(bTxt)/2, 18 );
  popMatrix();
}

void mousePressed() {
  if (mouseX > width/2 - bw/2 && mouseX < width/2 - bw/2 + bw
    && mouseY > height/2 - bh/2 && mouseY < height/2 - bh/2 + bh) {
    scene1 = false;
    scene2 = true;
    scene3 = false;
  
  }
}

void drawMycustomRobot(float xpos, float ypos, float r, float g, float b) {
  pushMatrix();

  //translate(mouseX,mouseY);
  translate(xpos - 120 + 25, ypos - 220 + 75);
 
  scale(0.5, 0.5);
  
 fill(#EA001B);
      noStroke();
      fill(#939393);
      strokeWeight(5);
      stroke(#000000);
      rect(164, 147, 65, 32);//gözün dışı için
      noStroke();
      fill(#000000);
      ellipse(198, 163, 26, 26);//sol göz için
      rect(228, 148, 16, 13);
      strokeWeight(5);
      stroke(#000000);
      strokeWeight(5);
      fill(#8d7a6f);
      ellipse(182, 263, 28, 28);//el bolgesindeki daire
      ellipse(292, 263, 28, 28);//el bolgesindeki daire
      fill(#939393);
      rect(244, 147, 65, 32);//sağdaki göz ün kutusu
      fill(#000000);
      noStroke();
      ellipse(275, 163, 26, 26);//sağdaki göz
      stroke(000000);
      fill(#F5DB72);
      rect(228, 161, 15, 56);  
      rect(216, 217, 40, 13);
      fill(#939393);
      rect(181, 235, 113, 33);//üst gövde
      fill(#F5DB72);
      rect(181, 265, 113, 78);//alt gövde
      fill(#E0CDB7);
      rect(181, 250, 21, 12);//el
      rect(181, 264, 21, 12);//el
      rect(272, 250, 21, 12);
      rect(272, 264, 21, 12);
      fill(#8d7a6f);
      //ayaktaki tekerlekler=
      rect(144, 285, 37, 29);
      rect(144, 313, 37, 29);
      rect(144, 341, 37, 29);
      rect(294, 283, 37, 29);
      rect(294, 313, 37, 29);
      rect(294, 341, 37, 29);
  popMatrix();
}