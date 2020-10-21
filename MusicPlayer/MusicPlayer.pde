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
int currentSong = numberOfSongs - numberOfSongs;
int loopNum = 1;

color white = #FFFFFF;
void setup() {

  size(900, 675);

  minim = new Minim(this);
  song[0] = minim.loadFile("jump man 93 - oldbandstuffs 1 (128 kbps).mp3");
  song[1] = minim.loadFile("jarjarjr - forty kal.mp3" );
  song[2] = minim.loadFile("jm93-bruh.mp3");
  song[3] = minim.loadFile("04 This_is_a_Jazz_Space.mp3");
};//End Setup

void draw() {
   background(255);
  stroke(0);
  fill(0);
  
  //Draw the waveforms
  //The values returned by left.get() and right.get() will be between -1 and 1,
  //  so we need to scale them up to see the waveform
  //Note: that if the file is MONO, left.get() and right.get() will return the same value
  
  for(int i = 0; i < song[0].bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, song[0].bufferSize(), 0, width );
    float x2 = map( i+1, 0, song[0].bufferSize(), 0, width );
    line( x1, 50 + song[0].left.get(i)*50, x2, 50 + song[0].left.get(i+1)*50 );
    line( x1, 150 + song[0].right.get(i)*50, x2, 150 + song[0].right.get(i+1)*50 );
  }
  
  //Draw a line to show where in the song playback is currently located
  float posx = map(song[0].position(), 0, song[0].length(), 0, width);
  stroke(0,200,0);
  line(posx, 0, posx, height);
  
  //Draw text depending on whether music is playing
  if ( song[0].isPlaying() )
  {
    text("Press SPACE to PAUSE.", 10, 20 );
  }
  else
  {
    text("Press SPACE to PLAY.", 10, 20 );
  }
};//End draw

void mousePressed() {
};//End mousePressed

void keyPressed() {

  if (key == ' ') { 
    if ( song[0].isPlaying() ) {
         song[0].pause();
    } else if ( song[0].position() == song[0].length()) {
      song[0].rewind();
      song[0].play();
    } else {
      song[0].play();
    }
  }

  if (key == 's') {
  song[0].pause();
  song[0].rewind();
  }
   if (key == 'a') {
  song[0].pause();
  song[0].rewind();
  song[0].play();
  } //END STOP BUTTON
  
  if ( key == 'l' || key == 'L') song[0].loop(); //single line IF
    
};//End keyPressed
