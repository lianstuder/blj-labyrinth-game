
// List of all scores
ArrayList<Integer> highscores = new ArrayList();

// Current highscore
int highscore;

// Query string
String query;

// Sqlite instance
SQLite db;

// Insert new score
void insert(int score)
{
  query = "INSERT INTO highscores VALUES (%02d)";
  try { 
    db.query(query, score);
  } 
  catch (Exception e) {
    println("Insertion skipped");
  }
}

// Fetch all scores and get highscore
void fetchAll()
{
  query = "SELECT * FROM highscores";
  try {
    db.query(query);

    while (db.next()) {
      highscores.add(db.getInt("highscore"));
      highscore = Collections.max(highscores);
    }
  } catch (Exception e) {
    println("Failed to fetch data ");
  }
}
