import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circle_color_picker/flutter_circle_color_picker.dart';
import 'package:provider/provider.dart';

import '../models/providerrtdb.dart';

// ignore: must_be_immutable
class PickColor extends StatefulWidget {
  PickColor({Key? key, required this.height, required this.widht})
      : super(key: key);
  double widht;
  double height;

  @override
  State<PickColor> createState() => _PickColorState();
}

class _PickColorState extends State<PickColor> {
  final _database = FirebaseDatabase.instance.ref();

  final _controller = CircleColorPickerController(
    initialColor: Colors.blue,
  );

  String _col = "";

  Color currentColor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderRTDB>(builder: (context, model, child) {
      return model.datosProvider != null
          ? Container(
              padding: const EdgeInsets.all(5),
              width: widget.widht,
              decoration: BoxDecoration(
                color: Colors.indigo.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Column(
                  children: [
                    const Text('Led Control'),
                    CircleColorPicker(
                      controller: _controller,
                      onChanged: (color) {
                        setState(() {
                          currentColor = color;
                          _col = color.toString();
                          _col = _col.replaceFirst('Color(0xff', '');
                          _col = _col.replaceAll(')', '');

                          _database
                              .child('disp${model.datosProvider!.disp}')
                              .update({
                            'color': _col,
                          });
                        });
                      },
                      size: Size(widget.height - 25, widget.height - 30),
                      textStyle: const TextStyle(fontSize: 0.0),
                      strokeWidth: 2,
                      thumbSize: 20,
                    ),
                    Row(
                      children: [
                        const Text('     Evento Ledes :'),
                        model.datosProvider!.ledsEvent
                            ? const Text('Ligado')
                            : const Text('Deligado')
                      ],
                    )
                  ],
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            );
    });
  }
}
