import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qrollcall/pages/multiusermodel.dart';

class UserWidget extends StatelessWidget {
  final User user;
  static int id = 1;
  const UserWidget({super.key, required this.user});

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
    id = user.id * 10;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        //fit: BoxFit.fill,
        child: Container(
          margin:
              const EdgeInsets.only(bottom: 15, top: 15, right: 10, left: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (id > 60) ? const Color.fromARGB(255, 251, 215, 109) : Colors.red.shade100,
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
                  height: 150, width: 130,
                  //child: Image.network(user.avatar),
                  child: CircularPercentIndicator(
                    radius: 40,
                    center: Text("${user.id} %"),
                    //footer: Text("Low Attendance",style: TextStyle(fontSize: 12),),
                    percent: (id.toDouble() % 100 / 100.0),
                    lineWidth: 6.0,
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: (id > 60) ? Colors.green : Colors.red,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${user.first_name} ${user.last_name}"),
                    Text("${user.id}"),
                    //Text("${user.email}"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
