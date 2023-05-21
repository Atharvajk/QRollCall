import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qrollcall/pages/multiusermodel.dart';
import 'package:velocity_x/velocity_x.dart';

class Student_attend_wid extends StatelessWidget {
  // final User user;
  // static int id = 1;
  final String? subjectname;
  final int? totalLectureOfsubject;
  final int? studentAttendedLecture;
  final int? totalPercentageAttendance;
  const Student_attend_wid(
      {super.key,
      required this.subjectname,
      required this.studentAttendedLecture,
      required this.totalLectureOfsubject,
      required this.totalPercentageAttendance});

  @override
  Widget build(BuildContext context) {
    // return Card(
    //   margin: EdgeInsets.all(10),
    //   child: ListTile(
    //     leading: Image.network(user.avatar),
    //     title: Text("${user.first_name}"),
    //     subtitle: Text("${user.last_name}"),
    //     trailing: Text("${user.id}"),
    //   ),
    // );

    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        height: 150, width: 150,
        margin: const EdgeInsets.only(bottom: 15, top: 15, right: 10, left: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: (totalPercentageAttendance! > 60)
              ? const Color.fromARGB(255, 251, 215, 109)
              : Colors.red.shade100,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 1,
            ),
          ],
        ),

        // margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              // color: Colors.amber,
              height: 100, width: 150,
              //color: Colors.black26,

              child: Container(
                height: 100, width: 130,
                //child: Image.network(user.avatar),
                child: CircularPercentIndicator(
                  radius: 40,
                  center: Text("$totalPercentageAttendance %"),
                  //footer: Text("Low Attendance",style: TextStyle(fontSize: 12),),
                  percent: (totalPercentageAttendance!.toDouble() / 100.0),
                  lineWidth: 6.0,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: (totalPercentageAttendance! > 60)
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    subjectname!,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ).p4(),
                  Text("$studentAttendedLecture / $totalLectureOfsubject"),
                  //Text("${user.email}"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
