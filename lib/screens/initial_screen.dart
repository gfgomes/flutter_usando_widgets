import 'package:flutter/material.dart';
import 'package:my_first_app/data/task_inherited.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'Level: ${TaskInherited.of(context)!.getGlobalLevel().toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400)),
                    ),
                  ],
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Icon(Icons.refresh),
            )
          ],
        ),
      ),
      body: ListView(
        children: TaskInherited.of(context)!.taskList,
        padding: EdgeInsets.only(top: 8, bottom: 100),
      ),
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
          );
        },
      ),
    );
  }
}
