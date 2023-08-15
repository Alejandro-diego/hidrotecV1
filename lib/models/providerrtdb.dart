import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:hidrotec/models/data.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProviderRTDB extends ChangeNotifier {
  DatosAD? _datosProvider;
 

  final _db = FirebaseDatabase.instance.ref();
  final _auth = FirebaseAuth.instance.authStateChanges();
  String _dispositivo = '463';

  late StreamSubscription<DatabaseEvent> _streamSubscription0;
 

  DatosAD? get datosProvider => _datosProvider;
 

  ProviderRTDB() {
    _obtener();
  }

  void _escuchar() {
    _streamSubscription0 =
        _db.child('disp$_dispositivo').onValue.listen((event) {
      final data = Map<String, dynamic>.from(
          event.snapshot.value as Map<dynamic, dynamic>);
      _datosProvider = DatosAD.fromRTDB(data);
      notifyListeners();
    });

  

   
  }

  @override
  void dispose() {
    _streamSubscription0.cancel();
  
    super.dispose();
  }

  void upSetTemp() {
    int upSET = _datosProvider!.tempSetting + 1;
    if (upSET >= 50) {
      upSET = 50;
    }
    _db.child('disp$_dispositivo').update({'setTemp': upSET});
  }

  void downSetTemp() {
    int downSET = _datosProvider!.tempSetting - 1;

    if (downSET <= 10) {
      downSET = 10;
    }

    _db.child('disp$_dispositivo').update({'setTemp': downSET});
  }

  Future<void> _obtener() async {
    SharedPreferences preference = await SharedPreferences.getInstance();

    // disp = preference.get('disp') ?? '01';
    _dispositivo = preference.getString('disp') ?? '01';
    seguir();
  }

  void seguir() {
    _auth.listen((User? user) {
      if (user == null) {
        _streamSubscription0.cancel();
    
      } else {
        _escuchar();
      }
    });
  }
}
