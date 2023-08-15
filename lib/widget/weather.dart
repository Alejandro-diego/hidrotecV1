import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hidrotec/models/datawt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late String zipCode;

  late Future<DataWt> futureData;

  @override
  void initState() {
    futureData = fetchAlbum();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.only(top: 0, bottom: 5, left: 5, right: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
          color: Colors.indigo.withOpacity(0.5)),
      height: 85,
      width: 110,
      child: FutureBuilder<DataWt>(
          future: futureData,
          builder: (context, snapshot) {

             if (snapshot.hasData){
            return Column(
              children: [
                const Text(
                  'Temperatura ambiente',
                  style: TextStyle(fontSize: 9),
                ),
                Text(
                  snapshot.hasData
                      ? '${snapshot.data!.temp}°'
                      : 'S/D',
                  style: const TextStyle(fontSize: 20),
                ),

              
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    
                    image: DecorationImage(
                      image: NetworkImage("http://openweathermap.org/img/w/${snapshot.data!.icon}.png",scale: 1),
                    ),
                  ),
                )
              ],
            );
          } else { return const Center(child: CircularProgressIndicator());} } ),
    );
  }

  Future<DataWt> fetchAlbum() async {
    SharedPreferences preference = await SharedPreferences.getInstance();

    zipCode = preference.getString('cep') ?? 'sem Data';

    zipCode = zipCode.replaceAll('.', '');
    
    final response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?zip=$zipCode,br&APPID=f3a6f2a2ee5dffc5949de6573c73f232&units=metric'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return DataWt.fromMap(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
