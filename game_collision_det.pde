// All imports
import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Collections;
import java.util.concurrent.TimeUnit;

PImage img;
PFont font;

// Character radius
int extent = 60;

// Collision detection
Boolean collision = false;
int fieldIndex;

// Path boxes
int rects[][] = {
  {0, 0, 70, 300}, 
  {0, 230, 300, 70}, 
  {230, 80, 70, 220}, 
  {230, 80, 250, 70}, 
  {410, 80, 70, 360}, 
  {410, 370, 700, 70}, 
  {1040, 370, 70, 170}, 
  {1040, 470, 200, 70}, 
  {1180, 470, 70, 370}, 
  {1180, 770, 300, 70}, 
  {1410, 610, 70, 230}, 
  {1410, 610, 450, 70}, 
  {1790, 610, 70, 400}, 
  {1000, 940, 860, 70}, 
  {1000, 650, 70, 360}, 
  {690, 610, 380, 70}, 
  {650, 610, 70, 70}
};


void setup() {
  noStroke();
  fullScreen();
  background(#509AFF);

  // Assets
  img = loadImage("ictlogo.png");

  // Timer blink
  blinkTime = millis();
  blinkOn = true;

  // Start point of character
  x = y = rects[0][2] / 2;
  
  // Setup SQLite database for highscore storage
  db = new SQLite(this, "labyrinthgame.db");
  if (db.connect()) {
    query = "CREATE TABLE IF NOT EXISTS highscores (highscore INTEGER NOT NULL)";
    db.query(query);
  }
}

void draw()
{
  // Redraw background and logo
  background(#509AFF);
  image(img, 50, 800);

  // Draw path
  generatePath();

  if (!gameover) {
    // Countdown
    tick();

    // Score 
    updateScore();

    // Character Control
    dragCharacter();
  }

  // Get current field
  for (int i=0; i < rects.length; i++) { 
    if (isInsideBox(rects[i]) == true) {
      fieldIndex = i;
    }
  }

  // Collision detection
  if (isInsideBox(rects[fieldIndex])) {
    println("INSIDE BOX");
  } else {
    if (extent > 20) {
      score -= 30;
      extent -= 10;
      t -= 5;
    } else {
      gameover();
    }
  }

  // Box collision for finish box
  if (isInsideBox(rects[rects.length-1])) victory();
}
