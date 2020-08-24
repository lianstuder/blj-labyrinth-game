
// Checks if cursor with radius is inside box object
boolean isInsideBox(int boxCollision[])
{
  if (    
    x - extent / 2 > boxCollision[0] 
    && x + extent / 2 < boxCollision[0] + boxCollision[2] 
    && y - extent / 2 > boxCollision[1] 
    && y + extent / 2 < boxCollision[1] + boxCollision[3] 
    ) {
    collision = false;
    return true;
  } else { 
    collision = true;
    return false;
  }
}

// Generate labyrinth
void generatePath()
{
  // Set anchor point to the top left
  rectMode(CORNER);

  // Draw every path box
  for (int i=0; i < rects.length-1; i++) {
    fill(255);
    int rect[] = rects[i];
    rect(rect[0], rect[1], rect[2], rect[3]);
  }

  // Draw finish box
  fill(0);
  int finishBox[] = rects[rects.length-1];
  square(finishBox[0], finishBox[1], finishBox[2]);
}

// Star shape
void star(float x, float y, float radius1, float radius2, int npoints)
{
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

// Draw star shape
void drawStar(int move)
{
  fill(#FFD812);
  pushMatrix();
  translate(1400 + move, 250);
  rotate(frameCount / 400.0);
  star(0, 0, 30, 70, 5); 
  popMatrix();
}
