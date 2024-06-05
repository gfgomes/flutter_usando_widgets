import 'package:flutter/material.dart';
import 'package:my_first_app/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;
  final List<Task> taskList = [
    // Task('Aprender Flutter', 'assets/images/1_img.png', 1),
    // Task('Aprender a andar de bike', 'assets/images/2_img.jpg', 2),
    // Task('Aprender a meditar', 'assets/images/3_img.jpeg', 3),
    // Task('Ler', 'assets/images/4_img.jpg', 4),
    // Task('Jogar', 'assets/images/5_img.jpg', 5),
  ];

  double getGlobalProgress() {
    double progress = 0.0;
    for (var task in taskList) {
      progress += ((task.level / task.difficulty) / taskList.length) / 10;
    }
    return progress;
  }

  double getGlobalLevel() {
    double level = 0.0;
    for (var task in taskList) {
      level += task.level;
    }
    return level;
  }

  void newTask(String name, String photo, int difficulty) {
    taskList.add(Task(
      name,
      photo,
      difficulty,
    ));
  }

  void deleteTask(Task task) {
    taskList.remove(task);
  }

  void RealoadScreen(Function() callback) {
    callback();
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    bool listaDeTarefasAleterda = oldWidget.taskList != taskList.length;
    return listaDeTarefasAleterda;
  }
}
