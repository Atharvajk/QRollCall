import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrollcall/classModel.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  String data = "https://www.wikipedia.org/";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Scan Here",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            width: 400,
            height: 400,
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 235, 166, 244)),
            child: QrImageView(
              data: data,
              size: 400.0,
            ),
          )
        ],
      ),
    );
  }
}
