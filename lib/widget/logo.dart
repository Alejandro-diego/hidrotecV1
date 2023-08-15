import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';


// ignore: must_be_immutable
class LogoHidrotec1 extends StatelessWidget {
  LogoHidrotec1({Key? key, required this.fontSize1, required this.fontSize2})
      : super(key: key);

  late double fontSize1;
  late double fontSize2;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedText(
          text:  Text(
            'HIDROTEC',
            style: TextStyle(
                fontFamily: 'ArialBlack', color: Colors.white70, fontSize: fontSize1),
          ),
          strokes: [
            OutlinedTextStroke(color: const Color(0xff1528ff), width: 5),
          ],
        ),
         Text(
          'PISCINA E AQUECEDORES SOLARES',
          style: TextStyle(
              fontFamily: 'ArialBlack', color: Colors.white, fontSize: fontSize2),
        ),
      ],
    );
  }
}
