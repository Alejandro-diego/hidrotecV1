import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DayButton extends StatefulWidget {
  DayButton({
    Key? key,
    required this.isButtonPress,
    required this.dia,
    required this.onClicked,
  }) : super(key: key);

  bool isButtonPress;
  String dia;
  final VoidCallback onClicked;

  @override
  State<DayButton> createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onClicked,
        child: AnimatedContainer(
          margin: const EdgeInsets.fromLTRB(12, 0, 0, 5),
          duration: const Duration(milliseconds: 100),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: widget.isButtonPress ? Colors.blueGrey : Colors.transparent,
            border: Border.all(
                color: widget.isButtonPress
                    ? const Color.fromARGB(255, 49, 45, 45)
                    : Colors.black),
            shape: BoxShape.circle,
          ),
          child: Center(
              child: Text(
            widget.dia,
            style: TextStyle(
                fontWeight:
                    widget.isButtonPress ? FontWeight.bold : FontWeight.normal,
                color: widget.isButtonPress ? Colors.black : Colors.grey),
          )),
        ),);
  }
}
