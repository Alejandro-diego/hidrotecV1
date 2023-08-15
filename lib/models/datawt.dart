class DataWt {
  String pais;
  double temp;
  String name;
  int humedad;
  String icon;
  DataWt(
      {required this.temp,
      required this.icon,
      required this.name,
      required this.humedad,
      required this.pais});

  factory DataWt.fromMap(Map<String, dynamic> map) {
    return DataWt(
        pais: map['sys']['country'],
        temp: map['main']['temp'],
        name: map['name'],
        humedad: map['main']['humidity'],
        icon: map['weather'][0]['icon']
        
        
        
        
        
        );
  }
}
