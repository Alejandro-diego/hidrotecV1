
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/providerrtdb.dart';



class LedButton extends StatefulWidget {
  const LedButton({Key? key}) : super(key: key);

  @override
  State<LedButton> createState() => _LedButtonState();
}

class _LedButtonState extends State<LedButton> {
  final _database = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    

    return Consumer<ProviderRTDB>(builder: (context, model, child) {
      if (model.datosProvider != null) {
        return Container(         
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
              color: Colors.indigo.withOpacity(0.5)),
          height: 130,
          width: 110,
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                const Text('I/O led'),
                const SizedBox(
                  height: 4,
                ),
                CupertinoSwitch(
                    value: model.datosProvider!.ledfixo,
                    onChanged: (bool v1) {
                      setState(() {
                        _database
                            .child('disp${model.datosProvider!.disp}')
                            .update({
                          'ledfixo': v1,
                          'efeito': false,
                        });
                      });
                    }),
                const SizedBox(
                  height: 4,
                ),
                const Text('Efeito'),
                const SizedBox(
                  height: 4,
                ),
                CupertinoSwitch(
                  value: model.datosProvider!.efeito,
                  onChanged: (bool v2) {
                    setState(
                      () {
                        _database
                            .child('disp${model.datosProvider!.disp}')
                            .update(
                          {
                            'efeito': v2,
                            'ledfixo': false,
                          },
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }
}
