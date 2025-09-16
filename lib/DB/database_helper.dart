import 'package:sqlite3/sqlite3.dart';

class DatabaseHelper {
  final Database db;

  DatabaseHelper._internal(this.db);

  // Factory method to open database
  factory DatabaseHelper() {
    final db = sqlite3.open('db.db');

    // Create table if not exists
    db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL
      );
    ''');
    return DatabaseHelper._internal(db);
  }

  // Insert
  void insertUser(String name, int age) {
    db.execute(
      'INSERT INTO users (name, age) VALUES (?, ?)',
      [name, age],
    );
  }

  // Read all users
  List<Map<String, Object?>> getUsers() {
    final result = db.select('SELECT * FROM users');
    return result.map((row) => row).toList();
  }

  // Update
  void updateUser(String name, int newAge) {
    db.execute(
      'UPDATE users SET age = ? WHERE name = ?',
      [newAge, name],
    );
  }

  // Delete
  void deleteUser(String name) {
    db.execute(
      'DELETE FROM users WHERE name = ?',
      [name],
    );
  }

  // Delete All
  void deleteAllUsers() {
    db.execute(
      'DELETE FROM users',
    );
  }

  // Close
  void close() {
    db.dispose();
  }
}
