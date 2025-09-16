import 'package:sqlite_demo/DB/database_helper.dart';

void main() {
  final dbHelper = DatabaseHelper();
  dbHelper.deleteAllUsers();
  dbHelper.insertUser('Shroia', 22);

  final users = dbHelper.getUsers();
  for (var user in users) {
    print(user['name']);
  }
}
