import 'package:sqlite3/sqlite3.dart';

class DatabaseHelper {
  final Database db;

  DatabaseHelper._internal(this.db);

  // Factory method to open database
  factory DatabaseHelper() {
    final db = sqlite3.open('db.db');

    // Create table if not exists
    db.execute('''
      CREATE TABLE IF NOT EXISTS Person (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        age INTEGER NOT NULL
      );
    ''');
    return DatabaseHelper._internal(db);
  }

  // Insert
  void insertPerson(String name, int age) {
    db.execute(
      'INSERT INTO Person (name, age) VALUES (?, ?)',
      [name, age],
    );
  }

  // Read all Person
  List<Map<String, Object?>> getPerson() {
    final result = db.select('SELECT * FROM Person');
    return result.map((row) => row).toList();
  }

  // Update
  void updateUser(String name, int newAge) {
    db.execute(
      'UPDATE Person SET age = ? WHERE name = ?',
      [newAge, name],
    );
  }

  // Delete
  void deleteUser(String name) {
    db.execute(
      'DELETE FROM Person WHERE name = ?',
      [name],
    );
  }

  // Delete All
  void deleteAllPerson() {
    db.execute(
      'DELETE FROM Person',
    );
  }

  // Close
  void close() {
    db.dispose();
  }
}
