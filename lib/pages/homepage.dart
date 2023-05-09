import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:velocity_x/velocity_x.dart';

import '../widgets/userwidget.dart';
import 'multiusermodel.dart';
import "package:http/http.dart" as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  final url = "https://reqres.in/api/users?page=2";
  static bool isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
    Future.delayed(Duration(milliseconds: 500), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(seconds: UserModel.users.length * 10),
          curve: Curves.linear);
    });
  }

  loaddata() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var userdata = decodedData["data"];
    UserModel.users =
        List.from(userdata).map<User>((user) => User.fromMap(user)).toList();
    setState(() {
    isloading = false;
      
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          FittedBox(
              child: const Text("Hello, Atharva!",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
                  .p20()),
          const Text("Your Attendance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              .px24(),
          Container(
            height: 230,
            width: 500,
            decoration: const BoxDecoration(
                // color: Colors.black26, //gradient: LinearGradient(colors: [Color.fromRGBO(251,251,253,1.000)],transform: GradientRotation(45.0))
                ),
            child: (isloading)
                ? ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Shimmer(
                        color: Colors.white,
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 201, 201, 201),
                              borderRadius: BorderRadius.circular(15)),
                        ).p8(),
                        
                      );
                    })
                : ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: UserModel.users.length,
                    //controller: scrollController,
                    itemBuilder: (context, index) {
                      return UserWidget(
                        user: UserModel.users[index],
                      );
                    },
                  ),
          ),
          Center(
            child: InkWell(
                onTap: () {},
                child: Ink(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: "Scan QR".text.white.center.scale(1.3).make()))),
          ),
          SizedBox(
            height: 24,
          ),
          const Text("Previous Attendance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
              .px24(),
          Container(
            height: 500,
            //color: Colors.white,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 216, 170, 231),
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: Text("${7 + index}:00 am"),
                    title: Text("Lecture No ${index + 1}"),
                    subtitle: Text("By Teacher No ${index + 1}"),
                    trailing: Icon(
                      Icons.check_circle,
                      color: Colors.black,
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
            ),
          ).p12()
        ]),
      )),
    );
  }
}
