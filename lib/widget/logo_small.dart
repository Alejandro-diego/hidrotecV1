import 'package:flutter/material.dart';
import 'package:outlined_text/outlined_text.dart';

class LogoHidrotec extends StatelessWidget {
  const LogoHidrotec({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
      width: 200,
      height: 34,
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: OutlinedText(
          text: const Text(
            'HIDROTEC',
            style: TextStyle(
                fontFamily: 'ArialBlack', color: Colors.white70, fontSize: 20),
          ),
          strokes: [
            OutlinedTextStroke(color: const Color(0xff1528ff), width: 6),
          ],
        ),
      ),
    );
  }
}
