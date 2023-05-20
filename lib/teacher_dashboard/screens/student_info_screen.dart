import 'package:flutter/material.dart';

class StudentInfo extends StatefulWidget {
  const StudentInfo({super.key});

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Column(
        children: [Text("Student info here")],
      ),
    );
  }
}
