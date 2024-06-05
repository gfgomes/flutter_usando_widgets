import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_first_app/data/task_inherited.dart';
import 'package:my_first_app/data/tasks_dao.dart';
import 'difficulty.dart';

class Task extends StatefulWidget {
  final String nome;
  final String photo;
  final int difficulty;
  late VoidCallback onTaskDeleted;

  Task(this.nome, this.photo, this.difficulty, {super.key});

  int level = 0;

  @override
  State<Task> createState() => _TaskState();

  static Task fromMap(Map<String, dynamic> e) {
    return Task(
      e['name'],
      e['image'],
      e['difficulty'],
    );
    //return Task(e['name'], 'assets/images/1_img.png', e['difficulty']);
  }

  Map<String, Object?> toMap() {
    return {
      'name': nome,
      'image': photo,
      'difficulty': difficulty,
    };
  }
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
                          onLongPress: () {
                            showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Deseja exlcuir a tarefa?'),
                                  content: const SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Text(
                                            'Esta ação não poderá ser desfeita.'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Cancelar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text(
                                        'Confirmar',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      onPressed: () {
                                        TasksDao().delete(widget.nome);
                                        widget.onTaskDeleted();
                                        Navigator.of(context).pop();
                                      },
                                      style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Colors.red)),
                                    )
                                  ],
                                );
                              },
                            );
                            //TasksDao().delete(widget.nome);
                          },
                          onPressed: () {
                            changeColorControl(context);
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

  void changeColorControl(BuildContext context) {
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
