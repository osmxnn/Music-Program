//Global Variables
float drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight;
float drawingDiameter;
boolean draw = false;
color ink, black=#000000;


void setup() {
  
size(500,600); 
quitButtonSetup();

drawingSurfaceX = width*0;
drawingSurfaceY = height*0;
drawingSurfaceWidth = width*3/4;
drawingSurfaceHeight =height*4/5;


rect(drawingSurfaceX, drawingSurfaceY, drawingSurfaceWidth, drawingSurfaceHeight); 
};//End Setup




void draw() {
  quitButtonDraw();
  
 if(draw == true) {fill(ink);
   ellipse(mouseX, mouseY, drawingDiameter, drawingDiameter);
 }//EndIf
 


};//End draw

void mousePressed() {
  if (mouseX>drawingSurfaceX  && mouseX<drawingSurfaceX+drawingSurfaceWidth  && mouseY>drawingSurfaceY && mouseY<drawingSurfaceY+drawingSurfaceHeight) {
  if (draw == false) {
   draw = true;
 } else {
   draw = false;
 }//End IF
  ink = black;
  drawingDiameter = width*1/100;
  }
  /*
 if (mouseX >= drawingSurfaceX  && mouseX <= drawingSurfaceX+drawingSurfaceWidth && mouseY >= drawingSurfaceY && mouseY <= drawingSurfaceY+drawingSurfaceHeight) {
  draw = false;
} else {
  draw = true;
}
*/
};//End mousePressed

void mouseReleased() {

  quitButtonMouseClicked();
};//End mousePressed

void keyPressed() {

  
  
};//End keyPressed
