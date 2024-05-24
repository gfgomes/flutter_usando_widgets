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
          ),
          const ColorRowWidget(
            0xffe20751,
            0xff8f11a5,
            0xff307cfa,
          ),
          const ColorRowWidget(
            0xfffa2c72,
            0xfffab700,
            0xff009dee,
          ),
          const ColorRowWidget(
            0xffd82cf6,
            0xfffafafa,
            0xff39a33d,
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

  const ColorRowWidget(
    this.colorFirstBox,
    this.colorSecondBox,
    this.colorThirdBox, {
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
              width: boxWidth,
              height: boxHeight,
              color: Color(colorFirstBox),
            ),
            Container(
              width: boxWidth,
              height: boxHeight,
              color: Color(colorSecondBox),
            ),
            Container(
              width: boxWidth,
              height: boxHeight,
              color: Color(colorThirdBox),
            ),
          ],
        ),
      ),
    );
  }
}
