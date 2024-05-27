import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Tarefas'),
        ),
        body: ListView(
          children: [
            const Task(
                "Aprender Flutter",
                "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",
                1),
            const Task(
                "Aprender a andar de bike",
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTtUFOIQ2wY1mB7r5Io35FTdVduQcXMcfD82r2D07p9ww&s",
                2),
            const Task(
                "Aprender a meditar",
                "https://manhattanmentalhealthcounseling.com/wp-content/uploads/2019/06/Top-5-Scientific-Findings-on-MeditationMindfulness-881x710.jpeg",
                3),
            const Task(
                "Ler",
                "https://thebogotapost.com/wp-content/uploads/2017/06/636052464065850579-137719760_flyer-image-1.jpg",
                4),
            Task('Jogar',
                'https://i.ibb.co/tB29PZB/kako-epifania-2022-2-c-pia.jpg', 5),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task(this.nome, this.foto, this.dificuldade, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
            ),
            Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.grey,
                          height: 100,
                          width: 80,
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Text(
                                widget.nome,
                                style: TextStyle(fontSize: 24),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: widget.dificuldade >= 1
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: widget.dificuldade >= 2
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: widget.dificuldade >= 3
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: widget.dificuldade >= 4
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: widget.dificuldade >= 5
                                        ? Colors.blue
                                        : Colors.blue[100],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 52,
                          width: 52,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                nivel++;
                              });
                            },
                            child: Column(
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
                      child: Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.green,
                          value: () {
                            if (widget.dificuldade > 0) {
                              double newLevel = nivel / widget.dificuldade;
                              return newLevel / 10;
                            }

                            return 1.0;
                          }(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Nível: $nivel",
                        style: TextStyle(
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
      ),
    );
  }
}
