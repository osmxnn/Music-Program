// Global Variables
String title= "X";
PFont quitButtonFont;
color black1 = 0; //Ink
color purpleQuitButton = #FFDBFB;
color redQuitButton = #FA6A6A;
color lightredQuitButton = #E57183;

void quitButtonRect() {
  rect(width*19/20, height*1/4, width*1/20, height*1/20);
}
void quitButtonSetup() {
  fill(255);
  quitButtonFont = createFont ("Harrington", 55); //Must also Tools / Create Font / Find Font / Do Not Press "OK"
  quitButtonRect(); //Quit Button
}

void quitButtonDraw() {
  //HoverOver
  if (mouseX >= width*19/20  && mouseX <= width && mouseY >= height*5/20 && mouseY <= height*6/20) {
    fill(redQuitButton);
    quitButtonRect();
  } else {
    fill(purpleQuitButton);
    quitButtonRect();
  }

  //Text in Quit Button
  fill(black1); //Ink, hexidecimal copied from Color Selector
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  textFont(quitButtonFont, 20); //Change the number until it fits, largest font size
  text(title, width*19/20, height*1/4, width*1/20, height*1/20);
  fill(255); //Reset to white for rest of the program
}

void quitButtonMouseClicked() {
  if (mouseX >= width*19/20  && mouseX <= width && mouseY >= height*5/20 && mouseY <= height*6/20) {
    exit();
  }
}
