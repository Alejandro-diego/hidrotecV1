import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IotechLogo extends StatelessWidget {
  const IotechLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.black.withOpacity(.6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'Power By',
            style: GoogleFonts.cedarvilleCursive(
              textStyle: const TextStyle(fontSize: 10),
            ),
          ),
          Text(
            'IOT',
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              textStyle: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
          Text(
            'ech',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}