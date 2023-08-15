import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widget/iotech_logo_smaill.dart';
import '../../widget/logo_small.dart';
import 'ble_home_page.dart';
import 'event_home.dart';
import 'home_movil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 56.0),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text('Hidrotec Controller'),
              actions: <Widget>[
                PopupMenuButton<int>(
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 0,
                      child: Row(
                        children: [
                          Icon(
                            Icons.date_range,
                          ),
                          Text(' Evento')
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                          ),
                          Text(' Sobre')
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: [
                          Icon(
                            Icons.bluetooth,
                          ),
                          Text(' ParearDisp')
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Row(
                        children: [
                          Icon(
                            Icons.logout,
                          ),
                          Text(' Sair')
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/image/azul.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: const HomePageMovil(),
      ),
    );
  }

  void onSelected(BuildContext context, int item) async {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const EventHome(),
          ),
        );
        break;
      case 1:
        about();
        break;
      case 2:

       Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const BleHomePage(),
          ),
        );




        break;
      case 3:
        FirebaseAuth.instance.signOut();
        break;
    }
  }

  void about() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black.withOpacity(.5),
          title: const Text("Acerca de"),
          content: SizedBox(
            height: 200,
            width: 300,
            child: Column(
              children: [
                const LogoHidrotec(),
                TextButton(
                  onPressed: () {
                    // ignore: deprecated_member_use
                    //  launch("mailto:hidrotecpiscinaseaquecedores@gmail.com");
                  },
                  child: const Text("alejandro.maxcom@gmail.com"),
                ),
                const IotechLogo(),
                const Text('www.iotech.dev.br'),
                const Text('Av AngeloMacalos 256'),
                const Text('Espumoso'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
