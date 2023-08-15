import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/providerrtdb.dart';
import '../../../utils.dart';
import '../../../widget/day_button.dart';

class LedsEvent extends StatefulWidget {
  const LedsEvent({Key? key}) : super(key: key);

  @override
  State<LedsEvent> createState() => _LedsEventState();
}

class _LedsEventState extends State<LedsEvent> {
  String iten1 = 'LedFixo';

  static const menuItems = <String>[
    'ledfixo',
    'efeito',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItens = menuItems
      .map((String value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList();

  final _db = FirebaseDatabase.instance.ref();
  late List<String> dias = ["D", "S", "T", "Q", "Q", "S", "S"];
  late String listTrue = '[true, true, true, true, true, true, true]';
  late String listFalse = '[false, false, false, false, false, false, false]';

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderRTDB>(builder: (context, data, child) {
      return data.datosProvider != null
          ? Container(
              margin: const EdgeInsets.all(6),
              height: 217,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.blueGrey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          'Leds',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.blue),
                        ),
                      ),
                      DropdownButton<String>(
                        value: data.datosProvider!.eventLedSwich,
                        onChanged: ((v) {
                          debugPrint(v);
                        

                          _db
                              .child('disp${data.datosProvider!.disp}')
                              .update({'eventLedSwich': v});
                        }),
                        items: _dropDownMenuItens,
                      ),
                      Row(
                        children: [
                          const Text('Habilitar'),
                          CupertinoSwitch(
                              activeColor:
                                  const Color.fromARGB(255, 49, 255, 56),
                              value: data.datosProvider!.ledsEvent,
                              onChanged: (bool a) {
                                _db
                                    .child('disp${data.datosProvider!.disp}')
                                    .update({'ledsEvent': a});
                              }),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                        child: Text(
                          "  Ligar: ${data.datosProvider!.ledsInitTime}      ",
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 18),
                        ),
                        onPressed: () async {
                          TimeOfDay? initTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (initTime == null) return;

                          final now = DateTime.now();
                          final time = DateTime(now.year, now.month, now.day,
                              initTime.hour, initTime.minute);

                          _db.child('disp${data.datosProvider!.disp}').update(
                            {'ledsInitTime': Utils.toTime(time)},
                          );
                        },
                      ),
                      Row(
                        children: [
                          const Text('Tudos os Dias'),
                          Checkbox(
                            checkColor: Colors.black,
                            value: data.datosProvider!.ledsAllDay,
                            onChanged: (bool? value) {
                              value!
                                  ? _db
                                      .child("disp${data.datosProvider!.disp}")
                                      .update({
                                      'ledsDaysInit': listTrue,
                                      'ledsDaysEnds': listTrue,
                                      'ledsAllDay': value
                                    })
                                  : _db
                                      .child("disp${data.datosProvider!.disp}")
                                      .update({
                                      'ledsDaysInit': listFalse,
                                      'ledsDaysEnds': listFalse,
                                      'ledsAllDay': value
                                    });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: dias.length,
                        itemBuilder: (context, index) {
                          var listOfDayBoll = json
                              .decode(data.datosProvider!.ledsDaysInit)
                              .cast<bool>()
                              .toList();

                          return DayButton(
                              isButtonPress: listOfDayBoll[index],
                              dia: dias[index],
                              onClicked: () {
                                listOfDayBoll[index] = !listOfDayBoll[index];
                                actualizarDays(
                                    data.datosProvider!.disp, listOfDayBoll);
                              });
                        }),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    child: Text(
                      "  Desligar: ${data.datosProvider!.ledsEndTime}",
                      style: const TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    onPressed: () async {
                      TimeOfDay? endTime = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());

                      if (endTime == null) return;

                      final now = DateTime.now();
                      final time = DateTime(now.year, now.month, now.day,
                          endTime.hour, endTime.minute);

                      _db
                          .child('disp${data.datosProvider!.disp}')
                          .update({'ledsEndTime': Utils.toTime(time)});
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: dias.length,
                        itemBuilder: (context, index) {
                          var listEndDayBoll = json
                              .decode(data.datosProvider!.ledsDaysEnds)
                              .cast<bool>()
                              .toList();

                          return DayButton(
                              isButtonPress: listEndDayBoll[index],
                              dia: dias[index],
                              onClicked: () {
                                listEndDayBoll[index] = !listEndDayBoll[index];
                                actualizarEndeDays(
                                    data.datosProvider!.disp, listEndDayBoll);
                              });
                        }),
                  ),
                ],
              ),
            )
          : const Center(
              child: CupertinoActivityIndicator(),
            );
    });
  }

  actualizarDays(String dsp, List listadedias) {
    _db.child('disp$dsp').update({'ledsDaysInit': listadedias.toString()});
  }

  actualizarEndeDays(String dsp, List listadedias1) {
    _db.child('disp$dsp').update({'ledsDaysEnds': listadedias1.toString()});
  }
}
