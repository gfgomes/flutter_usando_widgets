// difficulty.dart
import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';

class Difficulty extends StatelessWidget {
  final Task task;

  const Difficulty({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: task.dificuldade >= 1 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: task.dificuldade >= 2 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: task.dificuldade >= 3 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: task.dificuldade >= 4 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: task.dificuldade >= 5 ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}
