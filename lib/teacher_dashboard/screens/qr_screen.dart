import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrollcall/classModel.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({super.key});

  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  String data =
      "https://q-roll-backend.onrender.com/api/v1/mark-attendance/646d97e61cafc505f2d406e6";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Mark your Attendance",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            width: 400,
            height: 400,
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
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
