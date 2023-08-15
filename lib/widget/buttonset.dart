import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/providerrtdb.dart';

// ignore: must_be_immutable
class ButtonSET extends StatefulWidget {
   const ButtonSET({Key? key,}) : super(key: key);
 

  @override
  State<ButtonSET> createState() => _ButtonSETState();
}

class _ButtonSETState extends State<ButtonSET> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      width: 200,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.7),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black)),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () => Provider.of<ProviderRTDB>(context, listen: false)
                  .downSetTemp(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
              ),
              child: const Icon(
                Icons.arrow_downward_rounded,
              ),
            ),
            const Text('SET'),
            ElevatedButton(
              onPressed: () =>
                  Provider.of<ProviderRTDB>(context, listen: false).upSetTemp(),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
              ),
              child: const Icon(
                Icons.arrow_upward_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
