import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_first_app/components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;
  final List<Task> tasks = [
    Task('Aprender Flutter', 'assets/images/1_img.png', 1),
    Task('Aprender a andar de bike', 'assets/images/2_img.jpg', 2),
    Task('Aprender a meditar', 'assets/images/3_img.jpeg', 3),
    Task('Ler', 'assets/images/4_img.jpg', 4),
    Task('Jogar', 'assets/images/5_img.jpg', 5),
  ];

  void newTask(String name, String photo, int difficulty) {
    tasks.add(Task(name, photo, difficulty));
  }

  void deleteTask(Task task) {
    tasks.remove(task);
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return true;
  }
}
