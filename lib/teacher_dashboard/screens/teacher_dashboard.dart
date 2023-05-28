import 'package:flutter/material.dart';
import 'classmodel.dart';
import 'qr_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'student_info_screen.dart';

class TeacherDash extends StatefulWidget {
  const TeacherDash({super.key});

  @override
  State<TeacherDash> createState() => _TeacherDashState();
}

class _TeacherDashState extends State<TeacherDash> {
  String? dropVal;
  List<String> test = ['SE1', 'SE2', 'SE3'];
  List<String> lectures = ['DSA', 'PPL', 'M3', 'MP', 'FDS', 'M2'];
  List<String> practicals = ['DSAL', 'MPL', 'PBL'];
  bool isLecture = false;
  bool isPractical = false;
  List<String>? classLst;

  @override
  void initState() {
    super.initState();
    fetchClass();
    setState(() {
      isLecture = true;
    });
  }

  fetchClass() async {
    var url = Uri.parse('http://localhost:5000/api/v1/getclassroomdetails');
    try {
      print("before");
      var response = await http.get(url);
      var JsonData = jsonDecode(response.body);
      getClass getclass = getClass.fromJson(JsonData);
      setState(() {
        classLst = getclass.data!.map((e) => e.name!).toList();
      });
      print(classLst);
    } catch (e) {
      print(e);
    }
  }

  Widget getWidget() {
    if (isLecture) {
      return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 216, 170, 231),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StudentInfo()));
                },
                child: ListTile(
                  title: Text(lectures[index]),
                  trailing: const Icon(Icons.open_in_new_outlined,
                      color: Colors.black),
                ),
              ),
            ),
          );
        },
        itemCount: lectures.length,
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
      );
    } else if (isPractical) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const StudentInfo()));
            },
            child: Container(
              width: 50,
              height: 50,
              child: Card(
                color: Colors.white,
                child: Center(child: Text(practicals[index])),
              ),
            ),
          );
        },
        itemCount: practicals.length,
      );
    }

    return const Center(
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 212, 95, 232),
          backgroundColor: Colors.deepPurple,
          strokeWidth: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QRollCall",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer
            },
          ),
        ),
      ),
      drawer: SizedBox(
        width: 300,
        child: Drawer(
            backgroundColor: Colors.white,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 216, 170, 231),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://pbs.twimg.com/media/FVXi83paQAA5P1Q.jpg',
                              scale: 1),
                        ),
                        Text("jeff@yahoo.in")
                      ],
                    )),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 200,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all<double>(0),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white)),
                            onPressed: () {},
                            child: const Text(
                              "Logout",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            )),
                        const SizedBox(
                          child: Icon(
                            Icons.logout,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
              child: Text(
                "Hello Teacher!",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 30.0),
                child: Container(
                  width: 300,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      value: dropVal,
                      hint: dropVal != null
                          ? Text(
                              "$dropVal",
                              textAlign: TextAlign.center,
                            )
                          : const Text("Manage your classes"),
                      items: test.map<DropdownMenuItem<String>>((String val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      }).toList(),
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      onChanged: (String? val) {
                        setState(() {
                          dropVal = val;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isLecture = true;
                            });
                          },
                          child: const Text("Lectures")),
                      // Row(
                      //   children: [
                      //     Container(
                      //       width: 100,
                      //       height: 35,
                      //       decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(6),
                      //           color: Colors.yellow),
                      //       child: InkWell(
                      //         child: const Center(child: Text("Lectures")),
                      //         onTap: () {
                      //           setState(() {
                      //             isLecture = true;
                      //             isPractical = false;
                      //           });
                      //         },
                      //       ),
                      //     ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      // Container(
                      //   width: 100,
                      //   height: 35,
                      //   decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(6),
                      //       color: Colors.yellow),
                      //   child: InkWell(
                      //     child: const Center(
                      //       child: Text(
                      //         "Practicals",
                      //       ),
                      //     ),
                      //     onTap: () {
                      //       setState(() {
                      //         isPractical = true;
                      //         isLecture = false;
                      //       });
                      //     },
                      //   ),
                      // )
                      // ],
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Container(
                            width: 500, height: 400, child: getWidget()),
                      )
                    ],
                  )),
            ),
            // Center(
            //   child: Padding(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 30.0, vertical: 60),
            //     child: ElevatedButton(
            //         style: ButtonStyle(
            //           backgroundColor:
            //               MaterialStateProperty.all<Color>(Colors.black),
            //         ),
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => const QRScreen()));
            //         },
            //         child: const Text("Start")),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
