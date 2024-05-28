import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafio o Widget Contra Ataca',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blue,
          ),
          useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter: Primeiros Passos'),
          leading: ElevatedButton(
              onPressed: () {},
              child: Icon(
                Icons.more_time_rounded,
              )),
        ),
        body: Column(children: [
          const ColorRowWidget(
            0xfffafafa,
            0xfffa2c72,
            0xff2cbafa,
            boxWidth: 100,
            boxHeight: 150,
            icone: Icons.people,
          ),
          const ColorRowWidget(
            0xffe20751,
            0xff8f11a5,
            0xff307cfa,
            icone: Icons.people,
          ),
          const ColorRowWidget(
            0xfffa2c72,
            0xfffab700,
            0xff009dee,
            icone: Icons.people,
          ),
          const ColorRowWidget(
            0xffd82cf6,
            0xfffafafa,
            0xff39a33d,
            icone: Icons.people,
          ),
        ]),
      ),
    );
  }
}

class ColorRowWidget extends StatelessWidget {
  final int colorFirstBox;
  final int colorSecondBox;
  final int colorThirdBox;
  final double boxWidth;
  final double boxHeight;
  final IconData icone;

  const ColorRowWidget(
    this.colorFirstBox,
    this.colorSecondBox,
    this.colorThirdBox, {
    this.icone = Icons.more_time_rounded,
    this.boxWidth = 100,
    this.boxHeight = 150,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          left: 8.0,
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
                color: Color(colorFirstBox),
              ),
              width: boxWidth,
              height: boxHeight,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
                color: Color(colorSecondBox),
              ),
              width: boxWidth,
              height: boxHeight,
              child: Icon(icone),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(20),
                color: Color(colorThirdBox),
              ),
              width: boxWidth,
              height: boxHeight,
            ),
          ],
        ),
      ),
    );
  }
}
