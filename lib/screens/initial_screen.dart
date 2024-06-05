import 'package:flutter/material.dart';
import 'package:my_first_app/data/task_inherited.dart';
import 'package:my_first_app/data/tasks_dao.dart';
import 'package:my_first_app/screens/form_screen.dart';
import '../components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opaque = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //leading: Container(),
        actions: [
          IconButton(
              onPressed: () {
                _atualizarTela();
              },
              icon: const Icon(Icons.refresh))
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text('Tarefas'),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 180,
                      child: LinearProgressIndicator(
                        value: TaskInherited.of(context)!.getGlobalProgress(),
                        backgroundColor: Colors.blue[100],
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Level: ${TaskInherited.of(context)!.getGlobalLevel().toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                  ],
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                _atualizarTela();
              },
              child: const Icon(Icons.refresh),
            )
          ],
        ),
      ),
      body: FutureBuilder<List<Task>>(
          future: TasksDao().findAll(),
          builder: (context, snapshot) {
            List<Task>? taskList = snapshot.data;

            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Column(children: [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ]),
                );

                break;
              case ConnectionState.waiting:
                return const Center(
                  child: Column(children: [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ]),
                );
              case ConnectionState.active:
                return const Center(
                  child: Column(children: [
                    CircularProgressIndicator(),
                    Text('Carregando...')
                  ]),
                );
              case ConnectionState.done:
                if (snapshot.hasData && taskList != null) {
                  if (taskList.isNotEmpty) {
                    return ListView.builder(
                      itemCount: taskList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Task task = taskList[index];
                        task.onTaskDeleted = _atualizarTela;
                        return task;
                      },
                    );
                    _atualizarTela();
                  }
                  return const Center(
                    child: Column(
                      children: [
                        Icon(Icons.error_outline, size: 128),
                        Text('Nenhuma tarefa cadastrada!'),
                      ],
                    ),
                  );
                }
                return const Text('Erro ao carregar tarefas');
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then(
            (value) => setState(() {}),
          );
        },
      ),
    );
  }

  void _atualizarTela() {
    setState(() {
      print("recarregando a tela inicial");
    });
  }
}
