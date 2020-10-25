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


color white = #FFFFFF;
void setup() {

  size(900, 675);

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

  FFbuttonX1 = width*3/4;
  FFbuttonY1 = height*3/4;
  FFbuttonDiameter = 90;

  FRbuttonX1 = width*1/4;
  FRbuttonY1 = height*3/4;
  FRbuttonDiameter = 90;

  PB1InternalX1 = 455;
  PB1InternalY1 = height*23/32;
  PB1InternalX2 = 10;
  PB1InternalY2 = 40;

  PB2InternalX1 = 435;
  PB2InternalY1 = height*23/32;
  PB2InternalX2 = 10;
  PB2InternalY2 = 40;
  
  FFInternalX1 = width*72/100;
  FFInternalY1 = height*74/100;
  FFInternalX2 = 40;
  FFInternalY2 = 10;
  
  FFInternalTX1 =width*75/100;
  FFInternalTY1 =height*77/100;
  FFInternalTX2 = width*75/100;
  FFInternalTY2 = height*73/100;
  FFInternalTX3 = width*78/100;
  FFInternalTY3 = height*75/100;
  
  FRInternalX1 = width*24/100;
  FRInternalY1 = height*74/100;
  FRInternalX2 = 40;
  FRInternalY2 = 10;
  
  FRInternalTX1 =width*25/100;
  FRInternalTY1 =height*77/100;
  FRInternalTX2 = width*25/100;
  FRInternalTY2 = height*73/100;
  FRInternalTX3 = width*22/100;
  FRInternalTY3 = height*75/100;
  
 quitButtonSetup();
};//End Setup

void draw() {

  background(255);
  stroke(0);
  fill(0);

  //Draw the waveforms
  //The values returned by left.get() and right.get() will be between -1 and 1,
  //  so we need to scale them up to see the waveform
  //Note: that if the file is MONO, left.get() and right.get() will return the same value

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
  
 
  ellipse(playbuttonX1, playbuttonY1, playbuttonDiameter, playbuttonDiameter);
  ellipse( FFbuttonX1, FFbuttonY1, FFbuttonDiameter, FFbuttonDiameter);
  ellipse( FRbuttonX1, FRbuttonY1, FRbuttonDiameter, FRbuttonDiameter);
  rect(PB1InternalX1, PB1InternalY1, PB1InternalX2, PB1InternalY2);
  rect(PB2InternalX1, PB2InternalY1, PB2InternalX2, PB2InternalY2);
  rect(FFInternalX1, FFInternalY1, FFInternalX2, FFInternalY2);
  triangle(FFInternalTX1, FFInternalTY1, FFInternalTX2, FFInternalTY2, FFInternalTX3, FFInternalTY3);
  rect(FRInternalX1, FRInternalY1, FRInternalX2, FRInternalY2);
  triangle(FRInternalTX1, FRInternalTY1, FRInternalTX2, FRInternalTY2, FRInternalTX3, FRInternalTY3);
 

 
  

 quitButtonDraw();
};//End draw

void mousePressed() {
  //400 455 100 100
  if (mouseX>400 && mouseX< 400+100&& mouseY> 455 && mouseY<455+100) {   //pause
    if ( song[currentSong].isPlaying() ) {
      song[currentSong].pause();
    } else if ( song[currentSong].position() == song[currentSong].length()) {
      song[currentSong].rewind();
      song[currentSong].play();
    } else {
      song[currentSong].play();
    }
  }
  // width*14/20, height*17/25, 90, 90
  if (mouseX>width*14/20 && mouseX< width*14/20+90&& mouseY> height*17/25 && mouseY<height*17/25+90) song[currentSong].skip(5000);    //skip 5 seconds
  // width*4/20, height*17/25, 90, 90
  if (mouseX>width*4/20 && mouseX< width*4/20+90&& mouseY> height*17/25 && mouseY<height*17/25+90) song[currentSong].skip(-5000);    //go back 5 seconds
  
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
};//End keyPressed
