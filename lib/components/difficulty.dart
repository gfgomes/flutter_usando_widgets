// difficulty.dart
import 'package:flutter/material.dart';
import 'task.dart';

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
          color: task.difficulty >= 1 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: task.difficulty >= 2 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: task.difficulty >= 3 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: task.difficulty >= 4 ? Colors.blue : Colors.blue[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: task.difficulty >= 5 ? Colors.blue : Colors.blue[100],
        ),
      ],
    );
  }
}
