// Character movement 
int x;
int y;
float easing = 0.5;

// Countdown
String time = "010";
int t;
int interval = 120;

// Timer blink
int blinkTime;
boolean blinkOn;

// Score 
int score = 200;
int stars;

// Character controll
void dragCharacter()
{
  if (mousePressed) {
    float targetX = mouseX;
    float dx = targetX - x;
    x += dx * easing;

    float targetY = mouseY;
    float dy = targetY - y;
    y += dy * easing;
  }

  fill(#D91921);
  circle(x, y, extent);
}

// Countdown start
void tick()
{
  // Countdown
  t = interval - int(millis() / 1000);
  time = String.format("%02d:%02d", t / 60, t % 60);
  
  // Deletes score and returns if time is up
  if (t == 0) {
    score = 0;
    stars = 0;
  }

  fill(255);
  textSize(40);

  // Blinking text after 30s
  if (t < 30) {
    if (blinkOn) {
      // Conditional text coloring for count down
      fill(#D91921);
      text("Zeit verbleibend: " + time, 1300, 100);
    }

    if (millis() - 500 > blinkTime) {
      blinkTime = millis();
      blinkOn = !blinkOn;
    }
  } else text("Zeit verbleibend: " + time, 1300, 100);
}

// Calculates and shows stars
void updateScore()
{
  // Sterne bewertung
  if (t > 80) stars = 3;
  else if (t > 40) stars = 2;
  else if (t < 40) stars = 1;
    
  // Show score
  fill(255);
  text("Score: " + score, 1300, 150);
  
  // Show stars
  for (int i=0; i < stars; i++) {
    drawStar(i * 150);
  }
}
