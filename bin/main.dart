import 'package:sqlite_demo/DB/database_helper.dart';

void main() {
  final dbHelper = DatabaseHelper();
  dbHelper.deleteAllPerson();
}
