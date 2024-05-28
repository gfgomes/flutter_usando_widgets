import 'package:flutter/material.dart';
import 'package:my_first_app/components/desafios/myfirst_widget.dart';

void main() {
  runApp(const MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter: usando MyFirstWidget',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter: Primeiros Passos')),
        body: const MyFirstWidget(),
      ),
    );
  }
}
