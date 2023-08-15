class DatosAD {
  int temp;
  int tempSetting;
  bool ledfixo;
  bool efeito;
  bool pump;
  bool auto;
  String disp;
  String email;
  String name;
  bool pumpAllDay;
  String pumpDaysInit;
  String pumpDaysEnds;
  bool pumpEvent;
  String pumpInitTime;
  String pumpEndTime;
  bool ledsAllDay;
  String ledsDaysInit;
  String ledsDaysEnds;
  bool ledsEvent;
  String ledsInitTime;
  String ledsEndTime;
  String eventLedSwich;

  DatosAD({
    required this.eventLedSwich,
    required this.temp,
    required this.name,
    required this.email,
    required this.auto,
    required this.tempSetting,
    required this.pump,
    required this.ledfixo,
    required this.disp,
    required this.efeito,
//bomba
    required this.pumpAllDay,
    required this.pumpDaysEnds,
    required this.pumpDaysInit,
    required this.pumpEndTime,
    required this.pumpEvent,
    required this.pumpInitTime,

    //leds
    required this.ledsAllDay,
    required this.ledsDaysEnds,
    required this.ledsDaysInit,
    required this.ledsEndTime,
    required this.ledsEvent,
    required this.ledsInitTime,
  });

  factory DatosAD.fromRTDB(Map<String, dynamic> data) {
    return DatosAD(
      eventLedSwich: data['eventLedSwich'] ?? 'ledfixo',
        auto: data['auto'] ?? false,
        temp: data['temp'] ?? 2151,
        tempSetting: data['setTemp'] ?? 23,
        pump: data['pump'] ?? false,
        ledfixo: data['ledfixo'] ?? false,
        efeito: data['efeito'] ?? false,
        name: data['name'] ?? 'name',
        email: data['email'] ?? 'email',
        disp: data['disp'] ?? '1000',
        pumpAllDay: data['pumpAllDay'] ?? false,
        pumpDaysEnds: data['pumpDaysEnds'] ??
            '[false, false, false, false, false, false, false]',
        pumpDaysInit: data['pumpDaysInit'] ??
            '[false, false, false, false, false, false, false]',
        pumpEndTime: data['pumpEndTime'] ?? '00:00',
        pumpEvent: data['pumpEvent'] ?? false,
        pumpInitTime: data['pumpInitTime'] ?? '00:00',
        ledsAllDay: data['ledsAllDay'] ?? false,
        ledsDaysEnds: data['ledsDaysEnds'] ??
            '[false, false, false, false, false, false, false]',
        ledsDaysInit: data['ledsDaysInit'] ??
            '[false, false, false, false, false, false, false]',
        ledsEndTime: data['ledsEndTime'] ?? '00:00',
        ledsEvent: data['ledsEvent'] ?? false,
        ledsInitTime: data['ledsInitTime'] ?? '00:00');
  }
}
