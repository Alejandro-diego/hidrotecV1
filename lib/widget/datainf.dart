import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:segment_display/segment_display.dart';
import '../models/providerrtdb.dart';




// ignore: must_be_immutable
class SetTempContainer extends StatefulWidget {
   SetTempContainer({Key? key, required this.width  }) : super(key: key);
  double width;
  

  @override
  State<SetTempContainer> createState() => _SetTempContainerState();
}

class _SetTempContainerState extends State<SetTempContainer> {
  final _database = FirebaseDatabase.instance.ref();
 

  @override
  Widget build(BuildContext context) {
    
    return Container(
      
      width: widget.width,
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: Consumer<ProviderRTDB>(
        builder: (context, model, child) {
          if (model.datosProvider != null) {
            return Column(
              children: [
                const SizedBox(
                  height: 3.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black),
                  child: Center(
                      child: Column(
                    children: [
                      const Text(
                        'TempSet',
                        style: TextStyle(fontSize: 14.0, color: Colors.orange),
                      ),
                      SevenSegmentDisplay(
                        segmentStyle: HexSegmentStyle(
                            enabledColor: Colors.green,
                            disabledColor: Colors.green.withOpacity(0.15)),
                        backgroundColor: Colors.black,
                        value: model.datosProvider!.tempSetting.toString(),
                        size: 3,
                      ),
                    ],
                  )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black),
                  child: Center(
                    child: Column(
                      children: [
                        const Text('TempAtual',
                            style: TextStyle(
                                fontSize: 14.0, color: Colors.orange)),
                        SevenSegmentDisplay(
                          value: (model.datosProvider!.temp / 100).toString(),
                          size: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  'Bomba',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                CupertinoSwitch(
                    value: model.datosProvider!.pump,
                    onChanged: (bool v1) {
                      setState(() {
                        _database
                            .child('disp${model.datosProvider!.disp}')
                            .update({
                          'pump': v1,
                          'auto': false,
                        });
                      });
                    }),
                Text(
                  'Auto',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                CupertinoSwitch(
                    value: model.datosProvider!.auto,
                    onChanged: (bool v2) {
                      setState(() {
                        _database
                            .child('disp${model.datosProvider!.disp}')
                            .update({
                          'pump': false,
                          'auto': v2,
                        });
                      });
                    }),
                Container(
                  margin: const EdgeInsets.all(3),
                  height: 45,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[900]!.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Disp: ${model.datosProvider!.disp}',
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),

                      Icon(
                  
                  Icons.access_time,size: 17,
                  color: model.datosProvider!.pumpEvent ? Colors.red : Colors.grey.shade900,
                )





                    ],
                  ),
                ),
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
