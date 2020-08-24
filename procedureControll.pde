// Game state
boolean gameover = false;

// Game Over Screen
void gameover()
{  
  // Global gameover 
  gameover = true;

  // Data transaction
  try {
    insert(score);
    fetchAll();
  } catch (Exception e) {
    println("Insertion skipped");
  }

  // Window
  fill(0);
  rectMode(CENTER);
  rect(900, 550, width/2, height/2);

  // Text
  fill(#D91921);
  textSize(120);
  text("Game Over :(", 560, 450);
  textSize(90);
  text("Score: " + score, 685, 620);
  textSize(50);
  text("Highscore: " + highscore, 800, 700);
}

// Victory Screen
void victory()
{
  // Global gameover 
  gameover = true;

  // Data transaction
  try {
    insert(score);
    fetchAll();
  } catch (Exception e) {
    println("Insertion skipped");
  }

  // Window
  fill(255);
  rectMode(CENTER);
  rect(900, 550, width/2, height/2);

  // Text
  fill(#FFD812);
  textSize(120);
  text("Victory!", 700, 450);
  textSize(90);
  text("Score: " + score, 685, 620);
  textSize(50);
  text("Highscore: " + highscore, 800, 700);

}
