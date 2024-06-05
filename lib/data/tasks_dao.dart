import 'package:my_first_app/components/task.dart';
import 'package:my_first_app/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TasksDao {
  static const String tableSQL =
      "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, $_name TEXT, $_difficulty INTEGER, $_image TEXT)";

  static const _tableName = 'taskTable';
  static const _name = 'name';
  static const _difficulty = 'difficulty';
  static const _image = 'image';

  Future<int> save(Task task) async {
    final Database db = await getDatabase();

    final tasks = await find(task.nome);
    final dbTask = tasks.isEmpty ? null : tasks.first;

    if (dbTask == null) {
      print('Inserindo dados no banco de dados...');
      return await db.insert(_tableName, task.toMap());
    } else {
      print('Atualizando dados no banco de dados...');
      return await db.update(_tableName, task.toMap(),
          where: '$_name = ?', whereArgs: [task.nome]);
    }
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();

    List<Map<String, dynamic>> result = await db.query(_tableName);

    print('Procurando dados no banco de dados...encontrado:$result');

    List<Task> tasks = <Task>[];
    // for (Map<String, dynamic> taskMap in result) {
    //   final Task task = Task(
    //     taskMap['name'],
    //     taskMap['image'],
    //     taskMap['difficulty'],
    //   );
    //   tasks.add(task);
    // }
    tasks = result.map((e) => Task.fromMap(e)).toList();
    print("Lista de tarefas: $tasks");
    return tasks;
  }

  Future<List<Task>> find(String nomeDatarefa) async {
    final Database db = await getDatabase();
    List<Map<String, dynamic>> result = await db
        .query(_tableName, where: '$_name = ?', whereArgs: [nomeDatarefa]);

    List<Task> tasks = <Task>[];
    // for (Map<String, dynamic> taskMap in result) {
    //   final Task task = Task(
    //     taskMap['name'],
    //     taskMap['image'],
    //     taskMap['difficulty'],
    //   );
    //   tasks.add(task);
    // }
    tasks = result.map((e) => Task.fromMap(e)).toList();
    print("Lista de tarefas: $tasks");
    return tasks;
  }

  delete(String nomeDatarefa) async {
    final Database db = await getDatabase();

    try {
      await db
          .delete(_tableName, where: '$_name = ?', whereArgs: [nomeDatarefa]);
      print('Deletando tarefa no banco de dados...');
      return true;
    } catch (e) {
      print('Erro ao deletar tarefa: $e');
      return false;
    }
  }
}
