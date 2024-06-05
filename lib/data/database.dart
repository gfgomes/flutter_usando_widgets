import 'package:my_first_app/data/tasks_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'task.db'),
    onCreate: (db, version) {
      return db.execute(
        TasksDao.tableSQL,
      );
    },
    version: 1,
  );
  return database;
}
