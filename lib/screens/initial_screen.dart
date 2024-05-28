import 'package:flutter/material.dart';

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
        leading: Container(),
        title: const Text('Tarefas'),
      ),
      body: AnimatedOpacity(
        opacity: opaque ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task("Aprender Flutter", "assets/images/1_img.png", 1),
            Task("Aprender a andar de bike", "assets/images/2_img.jpg", 2),
            Task("Aprender a meditar", "assets/images/3_img.jpeg", 3),
            Task("Ler", "assets/images/4_img.jpg", 4),
            Task('Jogar', "assets/images/5_img.jpg", 5),
            SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:
            Icon(opaque ? Icons.remove_red_eye : Icons.remove_red_eye_outlined),
        onPressed: () {
          setState(() {
            opaque = !opaque;
          });
        },
      ),
    );
  }
}
