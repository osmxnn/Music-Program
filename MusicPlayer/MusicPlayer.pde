import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;



//Global Variables
Minim minim;
int numberOfSongs = 4;
AudioPlayer[] song = new AudioPlayer[numberOfSongs];
AudioMetaData[] songMetaData = new AudioMetaData[numberOfSongs];
int currentSong = 1;
int loopNum = 1;
float playbuttonX1, playbuttonY1, playbuttonDiameter;
float FFbuttonX1, FFbuttonY1, FFbuttonDiameter;
float FRbuttonX1, FRbuttonY1, FRbuttonDiameter;
float PB1InternalX1, PB1InternalY1, PB1InternalX2, PB1InternalY2;
float PB2InternalX1, PB2InternalY1, PB2InternalX2, PB2InternalY2;
float FFInternalX1, FFInternalY1, FFInternalX2, FFInternalY2;
float FFInternalTX1, FFInternalTY1, FFInternalTX2, FFInternalTY2, FFInternalTX3, FFInternalTY3;
float FRInternalX1, FRInternalY1, FRInternalX2, FRInternalY2;
float FRInternalTX1, FRInternalTY1, FRInternalTX2, FRInternalTY2, FRInternalTX3, FRInternalTY3;
float NSbuttonX1, NSbuttonY1, NSbuttonDiameter;
float NSbuttonInternalX1, NSbuttonInternalY1, NSbuttonInternalX2, NSbuttonInternalY2, NSbuttonInternalX3, NSbuttonInternalY3;
float NSbuttonInternal2X1, NSbuttonInternal2Y1, NSbuttonInternal2X2, NSbuttonInternal2Y2, NSbuttonInternal2X3, NSbuttonInternal2Y3;
float PSbuttonInternalX1, PSbuttonInternalY1, PSbuttonInternalX2, PSbuttonInternalY2, PSbuttonInternalX3, PSbuttonInternalY3;
float PSbuttonInternal2X1, PSbuttonInternal2Y1, PSbuttonInternal2X2, PSbuttonInternal2Y2, PSbuttonInternal2X3, PSbuttonInternal2Y3;
float PSbuttonX1, PSbuttonY1, PSbuttonDiameter;
float imageStartWidth, imageStartHeight, imageWidth, imageHeight, imageStartWidth1, imageStartHeight1, imageWidth1, imageHeight1;
float imageWidthRatio, imageWidthRatio1;
float imageHeightRatio, imageHeightRatio1;
PImage pic, pic1;
String stitle= "Song Title:" ;
PFont stitleFont;
color white = #FFFFFF;
void setup() {

  size(1200, 675);
  
pic = loadImage("https://bloximages.chicago2.vip.townnews.com/siouxcityjournal.com/content/tncms/assets/v3/editorial/f/ff/fff5a691-c4fb-53b9-9dba-167007fa78b7/5b2bee05b864e.image.jpg?resize=1200%2C675");
  imageWidthRatio = 675.0/1200.0;
  imageHeightRatio = 1200.0/1200.0;
  imageStartWidth = width*0/16;
  imageStartHeight = height*0/16;
  imageWidth = width;
  imageHeight = height*imageHeightRatio;
  
  minim = new Minim(this);
  song[0] = minim.loadFile("jump man 93 - oldbandstuffs 1 (128 kbps).mp3");
  song[1] = minim.loadFile("jarjarjr - forty kal.mp3" );
  song[2] = minim.loadFile("jm93-bruh.mp3");
  song[3] = minim.loadFile("04 This_is_a_Jazz_Space.mp3");
  /*
  songMetaData[0] = song[0].getMetaData();
   songMetaData[1] = song[1].getMetaData();
   songMetaData[2] = song[2].getMetaData();\
   */
  for (int i=0; i<song.length; i++) {
    songMetaData[i] = song[i].getMetaData();
    ;
  }//End Song MetaData



  println("Start Of Console");
  println("Click the Canvas To Finish Starting this App");
  println("Press SPACE to Play and Pause");
  println("Press A to Stop and Rewind");
  println("Press L to loop song");
  println("Press F to fast forward a song");
  println("Press R to skip backwards in a song");
  //Verifying Meta Data
  //Always Available
  println("\n\nVerifying MetaData");
  println( "File Name:", songMetaData[currentSong].fileName() );
  println( "Song Length (in milliseconds):", songMetaData[currentSong].length() );
  println( "Song Length (in seconds):", songMetaData[currentSong].length()/1000 );
  println( "Song Length (in minutes & seconds):", (songMetaData[currentSong].length()/1000)/60, "minutes", (songMetaData[currentSong].length()/1000)-((songMetaData[currentSong].length()/1000)/60 * 60), "seconds");
  println( "Title :", songMetaData[currentSong].title() );
  println( "Author :", songMetaData[currentSong].author() );
  println( "Composer :", songMetaData[currentSong].composer() );
  println( "Orchestra :", songMetaData[currentSong].orchestra() );
  println( "Album :", songMetaData[currentSong].album() );
  println( "Disc :", songMetaData[currentSong].disc() );
  println( "Publisher :", songMetaData[currentSong].publisher() );
  println( "Date Release :", songMetaData[currentSong].date() );
  println( "Copyright :", songMetaData[currentSong].copyright() );
  println( "Comment :", songMetaData[currentSong].comment() );
  println( "Lyrics :", songMetaData[currentSong].lyrics() );
  println( "Track :", songMetaData[currentSong].track() );
  println( "Genre :", songMetaData[currentSong].genre() );
  println( "Encoded :", songMetaData[currentSong].encoded() );

  playbuttonX1 = width*1/2;
  playbuttonY1 = height*3/4;
  playbuttonDiameter = 90;

  FFbuttonX1 = width*125/200;
  FFbuttonY1 = height*3/4;
  FFbuttonDiameter = 90;

  FRbuttonX1 = width*75/200;
  FRbuttonY1 = height*3/4;
  FRbuttonDiameter = 90;

  PB1InternalX1 = width*98/200;
  PB1InternalY1 = height*23/32;
  PB1InternalX2 = 10;
  PB1InternalY2 = 40;

  PB2InternalX1 = width*101/200;
  PB2InternalY1 = height*23/32;
  PB2InternalX2 = 10;
  PB2InternalY2 = 40;
  
  FFInternalX1 = width*119/200;
  FFInternalY1 = height*74/100;
  FFInternalX2 = 40;
  FFInternalY2 = 10;
  
  FFInternalTX1 =width*62/100;
  FFInternalTY1 =height*77/100;
  FFInternalTX2 = width*62/100;
  FFInternalTY2 = height*73/100;
  FFInternalTX3 = width*65/100;
  FFInternalTY3 = height*75/100;
  
  FRInternalX1 = width*75/200;
  FRInternalY1 = height*74/100;
  FRInternalX2 = 40;
  FRInternalY2 = 10;
  
  FRInternalTX1 =width*38/100;
  FRInternalTY1 =height*77/100;
  FRInternalTX2 = width*38/100;
  FRInternalTY2 = height*73/100;
  FRInternalTX3 = width*35/100;
  FRInternalTY3 = height*75/100;
  
  NSbuttonInternalX1 =width*75/100;
  NSbuttonInternalY1 =height*77/100;
  NSbuttonInternalX2 =width*75/100;
  NSbuttonInternalY2 =height*73/100;
  NSbuttonInternalX3 =width*77/100;
  NSbuttonInternalY3 =height*75/100;
  
  NSbuttonInternal2X1 =width*73/100;
  NSbuttonInternal2Y1 =height*77/100;
  NSbuttonInternal2X2 =width*73/100;
  NSbuttonInternal2Y2 =height*73/100;
  NSbuttonInternal2X3 =width*75/100;
  NSbuttonInternal2Y3 =height*75/100;
  
  NSbuttonX1 =width*50/200;
  NSbuttonY1 = height*3/4;
  NSbuttonDiameter = 90;
  
  PSbuttonInternalX1 =width*25/100;
  PSbuttonInternalY1 =height*77/100;
  PSbuttonInternalX2 =width*25/100;
  PSbuttonInternalY2 =height*73/100;
  PSbuttonInternalX3 =width*23/100;
  PSbuttonInternalY3 =height*75/100;
  
  PSbuttonInternal2X1 =width*27/100;
  PSbuttonInternal2Y1 =height*77/100;
  PSbuttonInternal2X2 =width*27/100;
  PSbuttonInternal2Y2 =height*73/100;
  PSbuttonInternal2X3 =width*25/100;
  PSbuttonInternal2Y3 =height*75/100;
  
  PSbuttonX1 =width*150/200;
  PSbuttonY1 = height*3/4;
  PSbuttonDiameter = 90;
  
 quitButtonSetup();
};//End Setup

void draw() {
  background(255);
  stroke(0);
  fill(0);
rect(imageStartWidth, imageStartHeight, imageWidth, imageHeight);
    image (pic, imageStartWidth, imageStartHeight, imageWidth, imageHeight);
  

 for (int i = 0; i < song[currentSong].bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, song[currentSong].bufferSize(), 0, width );
    float x2 = map( i+1, 0, song[currentSong].bufferSize(), 0, width );
    line( x1, 50 + song[currentSong].left.get(i)*50, x2, 50 + song[currentSong].left.get(i+1)*50 );
    line( x1, 150 + song[currentSong].right.get(i)*50, x2, 150 + song[currentSong].right.get(i+1)*50 );
  }

  //Draw a line to show where in the song playback is currently located
  float posx = map(song[currentSong].position(), 0, song[currentSong].length(), 0, width);
  stroke(0, 200, 0);
  line(posx, 0, posx, height);

  //Draw text depending on whether music is playing
  if ( song[currentSong].isPlaying() )
  {
    text("Press SPACE to PAUSE.", 10, 20 );
  } else
  {
    text("Press SPACE to PLAY.", 10, 20 );
  }
  

  fill(#FFFFFF);
  stroke(0);
  /*
  rect(width*21/100, height*136/200, 95, 95);      //       Previous Song Box Outline
  rect(width*71/100, height*136/200, 95, 95);      //       Next Song Box Outline
  rect(width*92/200, height*136/200, 95, 95);      //       Pause Button Box Outline
  rect(width*117/200, height*136/200, 95, 95);     //       Fast Forward Box Outline
  rect(width*67/200, height*136/200, 95, 95);      //       Rewind Box Outline
  */
  ellipse(playbuttonX1, playbuttonY1, playbuttonDiameter, playbuttonDiameter);
  ellipse( FFbuttonX1, FFbuttonY1, FFbuttonDiameter, FFbuttonDiameter);
  ellipse( FRbuttonX1, FRbuttonY1, FRbuttonDiameter, FRbuttonDiameter);
  rect(PB1InternalX1, PB1InternalY1, PB1InternalX2, PB1InternalY2);
  rect(PB2InternalX1, PB2InternalY1, PB2InternalX2, PB2InternalY2);
  rect(FFInternalX1, FFInternalY1, FFInternalX2, FFInternalY2);
  triangle(FFInternalTX1, FFInternalTY1, FFInternalTX2, FFInternalTY2, FFInternalTX3, FFInternalTY3);
  rect(FRInternalX1, FRInternalY1, FRInternalX2, FRInternalY2);
  triangle(FRInternalTX1, FRInternalTY1, FRInternalTX2, FRInternalTY2, FRInternalTX3, FRInternalTY3);
  ellipse(NSbuttonX1, NSbuttonY1, NSbuttonDiameter, NSbuttonDiameter);
  ellipse(PSbuttonX1, PSbuttonY1, PSbuttonDiameter, PSbuttonDiameter);
  triangle(NSbuttonInternalX1, NSbuttonInternalY1, NSbuttonInternalX2, NSbuttonInternalY2, NSbuttonInternalX3, NSbuttonInternalY3);
  triangle(PSbuttonInternalX1, PSbuttonInternalY1, PSbuttonInternalX2, PSbuttonInternalY2, PSbuttonInternalX3, PSbuttonInternalY3);
  triangle(NSbuttonInternal2X1, NSbuttonInternal2Y1, NSbuttonInternal2X2, NSbuttonInternal2Y2, NSbuttonInternal2X3, NSbuttonInternal2Y3);
  triangle(PSbuttonInternal2X1, PSbuttonInternal2Y1, PSbuttonInternal2X2, PSbuttonInternal2Y2, PSbuttonInternal2X3, PSbuttonInternal2Y3);



    
 quitButtonDraw();
};//End draw

void mousePressed() {
  //400 455 100 100 // width*92/200, height*136/200, 95, 95
  if (mouseX>width*92/200 && mouseX< width*92/200+95&& mouseY> height*136/200 && mouseY<height*136/200+95) {   //pause
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() == song[currentSong].length()) {
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }
  // width*117/200, height*17/25, 90, 90
  if (mouseX>width*117/200 && mouseX< width*117/200+90&& mouseY> height*17/25 && mouseY<height*17/25+90) song[currentSong].skip(5000);    //skip 5 seconds
  // width*4/20, height*17/25, 90, 90
  if (mouseX>width*67/200 && mouseX< width*67/200+90&& mouseY> height*17/25 && mouseY<height*17/25+90) song[currentSong].skip(-5000);    //go back 5 seconds
  
  if (mouseX>width*71/100 && mouseX< width*71/100+90&& mouseY> height*17/25 && mouseY<height*17/25+90) { //Next Button to Console
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - 1) {
        currentSong = currentSong - (numberOfSongs-1);
      } else {
        currentSong = currentSong + 1;
      }
      println(currentSong);
      song[currentSong].play();
    } else {
      if ( currentSong == numberOfSongs - 1) {
        currentSong = currentSong - (numberOfSongs);
      }
      currentSong = currentSong + 1;
      println("Current Song ", "Number: "+currentSong);
    }
  }

 if (mouseX>width*21/100 && mouseX< width*21/100+90&& mouseY> height*17/25 && mouseY<height*17/25+90) { //Next Button to Console
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        println ("Current Song is the first song, ", "Number: " + currentSong); //For Debugging
        currentSong = numberOfSongs - 1;
        println ("Current Song is now the last song, ", "Number: " + currentSong); //For Debugging
      } else {
        currentSong -= 1; // Equivalent code: currentSong = currentSong - 1
        println ("Current Song after the next or back button, but not the first song", "\tNumber: " + currentSong); //For Debugging
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        println ("Current Song is the first song, ", "Number: " + currentSong); //For Debugging
        currentSong = numberOfSongs - 1;
        println ("Current Song is now the last song, ", "Number: " + currentSong); //For DebuggingcurrentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong -= 1; // Equivalent code: currentSong = currentSong - 1
        println ("Current Song ", "Number: "+currentSong); //For Debugging
      }
    }
  }
 quitButtonMouseClicked();
};//End mousePressed

void keyPressed() {

  if (key == ' ') { 
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() == song[currentSong].length()) {
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }

  if (key == 's') {
    song[currentSong].pause();
    song[currentSong].rewind();
  }
  if (key == 'a') {
    song[currentSong].pause();
    song[currentSong].rewind();
    song[currentSong].play();
  } //END STOP BUTTON

  if ( key == 'l' || key == 'L') song[currentSong].loop(loopNum); 
  if ( key == 'f' || key == 'F') song[currentSong].skip(5000); 
  if ( key == 'r' || key == 'R') song[currentSong].skip(-5000);
  
 
  println ("Current Song before the next or back button, ", "Number: "+currentSong); //For Debugging
  //Solution for Back or Previous Button, copy the next button code: change to -1, change previous song at beginning to last song
  
  if (key == 'p' || key == 'P') { //Next Button to Console
    if (song[currentSong].isPlaying()) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        println ("Current Song is the first song, ", "Number: " + currentSong); //For Debugging
        currentSong = numberOfSongs - 1;
        println ("Current Song is now the last song, ", "Number: " + currentSong); //For Debugging
      } else {
        currentSong -= 1; // Equivalent code: currentSong = currentSong - 1
        println ("Current Song after the next or back button, but not the first song", "\tNumber: " + currentSong); //For Debugging
      }
      song[currentSong].play();
    } else {
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - numberOfSongs ) {
        println ("Current Song is the first song, ", "Number: " + currentSong); //For Debugging
        currentSong = numberOfSongs - 1;
        println ("Current Song is now the last song, ", "Number: " + currentSong); //For DebuggingcurrentSong = numberOfSongs - numberOfSongs;
      } else {
        currentSong -= 1; // Equivalent code: currentSong = currentSong - 1
        println ("Current Song after the next or back button, but not the first song, ", "Number: "+currentSong); //For Debugging
      }
    }
  }
  
  if (key == 'b' || key == 'B') { //previous Button to Console
        if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
      song[currentSong].rewind();
      if ( currentSong == numberOfSongs - 1) {
        currentSong = currentSong - (numberOfSongs-1);
      } else {
        currentSong = currentSong + 1;
      }
      println(currentSong);
      song[currentSong].play();
    } else {
      if ( currentSong == numberOfSongs - 1) {
        currentSong = currentSong - (numberOfSongs);
      }
      currentSong = currentSong + 1;
      println("Current Song ", "Number: "+currentSong);
    }
  }
};//End keyPressed
