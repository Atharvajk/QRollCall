import 'package:flutter/material.dart';
import 'student_profile.dart';
import 'qr_screen.dart';

class StudentInfo extends StatefulWidget {
  const StudentInfo({super.key});

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  List<String> studentList = [
    "Akash Harale",
    "Atharva Khodke",
    "Yadnesh Gangurde",
    "Satvik Doshi",
    "Johan Liebert"
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "CLASS ATTENDANCE",
                style: TextStyle(fontSize: 30.0),
              ),
            ),
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 232, 207, 246),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3), // Shadow color
                    spreadRadius: 1, // Spread radius
                    blurRadius: 3, // Blur radius
                    offset:
                        const Offset(0, 2), // Offset in the x and y directions
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("ALERT")),
                  const Stack(alignment: Alignment.center, children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        value: 1.0,
                      ),
                    ),
                    Text(
                      "0%",
                      style: TextStyle(fontSize: 20),
                    )
                  ]),
                  ElevatedButton(onPressed: () {}, child: const Text("PDF"))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 227, 226, 226))),
                    child: const SizedBox(
                      width: 80,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Filter",
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.arrow_downward_rounded,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QRScreen()));
                      },
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(100, 40))),
                      child: const Text("START"))
                ],
              ),
            )
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 12.0),
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all<Color>(
            //             const Color.fromARGB(255, 227, 226, 226))),
            //     child: SizedBox(
            //       width: 80,
            //       height: 40,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           const Text(
            //             "Filter",
            //             style: TextStyle(color: Colors.black),
            //           ),
            //           const Icon(
            //             Icons.arrow_downward_rounded,
            //             color: Colors.black,
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            ,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Container(
                  width: 400,
                  height: 500,
                  child: ListView.separated(
                      itemBuilder: ((context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 216, 170, 231),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Student()));
                              },
                              child: ListTile(
                                subtitle: const Text("21499",style: TextStyle(color: Colors.black)),
                                title: Text(studentList[index]),
                                trailing: const Icon(Icons.open_in_new_outlined,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        );
                      }),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: studentList.length)),
            )
          ],
        ),
      ),
    );
  }
}
