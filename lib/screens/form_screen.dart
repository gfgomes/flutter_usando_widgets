import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova tarefa'),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3, color: Colors.black)),
          height: 875,
          width: 430,
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
