import 'package:flutter/material.dart';
import 'package:hidrotec/screen/home/screen_relay_evet/bombaevent.dart';
import 'package:hidrotec/screen/home/screen_relay_evet/ledsevent.dart';
import 'package:intl/date_symbol_data_local.dart';

class EventHome extends StatefulWidget {
  const EventHome({Key? key}) : super(key: key);

  @override
  State<EventHome> createState() => _EventHomeState();
}

class _EventHomeState extends State<EventHome> {
  @override
  void initState() {
    initializeDateFormatting();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Event"),
      ),
      body: const SingleChildScrollView(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [PumpEvent(), LedsEvent()],
        ),
      )),
    );
  }
}
