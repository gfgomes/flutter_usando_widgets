import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter: Meus primeiros passos'),
          ),
          body: Container(
            color: Colors.black,
          ),
          floatingActionButton: Row(children: [
            FloatingActionButton(onPressed: () {}),
          ], mainAxisAlignment: MainAxisAlignment.center)),
    );
  }
}
