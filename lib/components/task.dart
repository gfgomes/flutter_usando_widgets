import 'dart:math';
import 'package:flutter/material.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String photo;
  final int difficulty;

  Task(this.nome, this.photo, this.difficulty, {super.key});

  int level = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  MaterialColor levelColor = Colors.blue;

  bool isAsset() {
    if (widget.photo.contains('https://') || widget.photo.contains('http://')) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: levelColor,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey,
                        ),
                        height: 100,
                        width: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: isAsset()
                              ? Image.asset(
                                  widget.photo,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  widget.photo,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Difficulty(task: widget),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            changeColorControl();
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.blue[200],
                        value: () {
                          if (widget.difficulty > 0) {
                            double newProgressValidVal =
                                (widget.level / widget.difficulty) / 10;
                            if (newProgressValidVal <= 1) {
                              return newProgressValidVal;
                            }
                          }
                          return 0.0;
                        }(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Nível: ${widget.level}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  void changeColorControl() {
    return setState(() {
      widget.level++;

      double newLevelRestartController =
          (widget.level / widget.difficulty) / 10;

      bool isLevelCompleted = newLevelRestartController > 1;
      if (isLevelCompleted) {
        levelColor =
            Colors.primaries[Random().nextInt(Colors.primaries.length)];
        widget.level = 1;
      }
    });
  }
}
