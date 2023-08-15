import 'package:flutter/material.dart';

import '../../widget/buttonled.dart';
import '../../widget/buttonset.dart';
import '../../widget/circulo.dart';
import '../../widget/datainf.dart';
import '../../widget/gauge.dart';
import '../../widget/logo_small.dart';
import '../../widget/weather.dart';

class HomePageMovil extends StatefulWidget {
  const HomePageMovil({Key? key}) : super(key: key);

  @override
  State<HomePageMovil> createState() => _HomePageMovilState();
}

class _HomePageMovilState extends State<HomePageMovil> {
  
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Center(
            child: Column(
              children: [
                Container(
                  height: 310,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                      top: size.height * .135, left: 5, right: 5, bottom: 10),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[800]!.withOpacity(0.6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SetTempContainer(
                       
                        width: size.width * .35,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Gauge(),
                          ButtonSET(),
                          LogoHidrotec(),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 240,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey[800]!.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PickColor(
                  height: 210,
                  widht: 210,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LedButton(),
                    SizedBox(
                      height: 8,
                    ),
                    Weather(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  
}
