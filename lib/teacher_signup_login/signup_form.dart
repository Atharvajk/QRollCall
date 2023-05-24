import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:qrollcall/constants.dart';
import 'package:qrollcall/info/userprofile.dart';
import 'package:qrollcall/pages/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../info/profile.dart';
import 'already_have_an_account_check.dart';
import 'login_screen.dart';
import 'package:qrollcall/classModel.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  static List<num> list = <num>[1, 2, 3, 4, 5, 6, 7, 8];
  final _formKey = GlobalKey<FormState>();
  bool isClassSelected = false;
  bool showPass = false;
  String? classDropDownVal;

  TextEditingController pass = TextEditingController();
  TextEditingController passcnf = TextEditingController();

  String? nameVal;
  String? depVal;
  String? semVal;
  String? divVal;
  String? phoneVal;
  String? rollVal;
  String? emailVal;
  String? passVal;
  List<String>? classLst;

  @override
  void initState() {
    super.initState();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    var url = Uri.parse(
        'https://q-roll-backend.onrender.com/api/v1/getclassroomdetails');
    try {
      var response = await http.get(url);
      var JsonData = jsonDecode(response.body);
      getClass getclass = getClass.fromJson(JsonData);
      setState(() {
        classLst = getclass.data!.map((e) => e.name!).toList();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          child: Text("Something went wrong!"),
        ),
        behavior: SnackBarBehavior.floating,
      ));
      print(e);
    }
  }

  void saveuser_data(Response response) async {
    final userlogJson = response.body;
    Map<String, dynamic> userMap = jsonDecode(userlogJson);
    var user = profileuser.fromJson(userMap);
    //   print('Howdy, ${user.data?.name}!');
    // print('We sent the verification link to ${user.data?.email}.');
    user.savedata();
    print("Data saved successdully!");
    // var sharedprefs = await SharedPreferences.getInstance();
    // sharedprefs.setString(LoginStatus.id, user_data.);
  }

  postData() async {
    var sharedpref = await SharedPreferences.getInstance();

    var regBody = {
      "name": "$nameVal",
      "department": "$depVal",
      "semister": "${semVal.toString()}",
      "classroom": "$divVal",
      "mobileNum": "$phoneVal",
      "rollNo": "$rollVal",
      "email": "$emailVal",
      "password": "$passVal"
    };

    try {
      var response = await http.post(
          Uri.parse(
              "https://q-roll-backend.onrender.com/api/v1/savestuddetails"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(regBody));
      // print(response.body.toString());
      print("Requested...");
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        saveuser_data(response);
        //login success
        sharedpref.setBool(LoginStatus.LOGKEY, true);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ),
        );
      } else {
        sharedpref.setBool(LoginStatus.LOGKEY, false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Container(
            child: Text("Wrong email-password combination!"),
          ),
          behavior: SnackBarBehavior.floating,
        ));
      }
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          child: Text("Something went wrong!"),
        ),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }

  bool isSelected = false;
  static var dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            validator: (val) {
              if (val!.isEmpty) {
                return "Enter your name";
              }
              if (val.trim().isEmpty) {
                return "Name cannot be empty";
              }
              if (!RegExp(r"^[a-zA-Z ]+$").hasMatch(val)) {
                return "Enter a valid name";
              }
              return null;
            },
            onSaved: (val) {
              nameVal = val;
            },
            decoration: const InputDecoration(
              hintText: "Name",
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter department(CS/IT/ENTC)";
                }
                if (!['cs', 'it', 'entc'].contains(val.toLowerCase())) {
                  return "Enter correct department(CS/IT/ENTC)";
                }
                return null;
              },
              onSaved: (val) {
                depVal = val;
              },
              decoration: const InputDecoration(
                hintText: "Department",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.next_week),
                ),
              ),
            ),
          ),
          // InputDecorator(
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(60.0),
          //         borderSide: const BorderSide(color: kPrimaryLightColor)),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(60.0),
          //       borderSide:
          //           const BorderSide(color: kPrimaryLightColor, width: 1.0),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(60.0),
          //       borderSide:
          //           const BorderSide(color: kPrimaryLightColor, width: 2.0),
          //     ),
          //   ),
          //   child: DropdownButtonFormField<num>(
          //     isExpanded: true,
          //     hint: isSelected
          //         ? Text("$dropdownValue")
          //         : const Text("Select semester"),
          //     // value: dropdownValue,

          //     items: list.map<DropdownMenuItem<num>>((num value) {
          //       return DropdownMenuItem<num>(
          //         value: value,
          //         child: Text(value.toString()),
          //       );
          //     }).toList(),
          //     icon: const Icon(
          //       Icons.arrow_drop_down_circle,
          //       color: kPrimaryColor,
          //     ),
          //     onChanged: (num? value) {
          //       // This is called when the user selects an item.
          //       setState(() {
          //         dropdownValue = value!;
          //         semVal = value.toString();
          //         isSelected = true;
          //       });
          //     },
          //     dropdownColor: kPrimaryLightColor,
          //     elevation: 8,
          //     style: const TextStyle(color: Colors.black),
          //     decoration: const InputDecoration.collapsed(hintText: ''),
          //   ),
          // ),
          const SizedBox(height: defaultPadding),
          // InputDecorator(
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(60.0),
          //         borderSide: const BorderSide(color: kPrimaryLightColor)),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(60.0),
          //       borderSide:
          //           const BorderSide(color: kPrimaryLightColor, width: 1.0),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(60.0),
          //       borderSide:
          //           const BorderSide(color: kPrimaryLightColor, width: 2.0),
          //     ),
          //   ),
          //   child: Stack(
          //     children: [
          //       DropdownButtonHideUnderline(
          //         child: DropdownButtonFormField<String>(
          //           isExpanded: true,
          //           hint: isClassSelected
          //               ? Text("$classDropDownVal")
          //               : const Text("Select class"),
          //           items:
          //               classLst?.map<DropdownMenuItem<String>>((String val) {
          //             return DropdownMenuItem<String>(
          //               value: val,
          //               child: Text(val),
          //             );
          //           }).toList(),
          //           icon: const Icon(
          //             Icons.arrow_drop_down_circle,
          //             color: kPrimaryColor,
          //           ),
          //           onChanged: (String? val) {
          //             // Handle onChanged even
          //             setState(() {
          //               classDropDownVal = val;
          //               isClassSelected = true;
          //               divVal = val;
          //             });
          //           },
          //           dropdownColor: kPrimaryLightColor,
          //           elevation: 8,
          //           style: const TextStyle(color: Colors.black),
          //           decoration: const InputDecoration.collapsed(hintText: ''),
          //         ),
          //       ),
          //       if (classLst == null)
          //         const Positioned.fill(
          //           child: Center(
          //             child: CircularProgressIndicator(),
          //           ),
          //         ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          //   child: TextFormField(
          //     autovalidateMode: AutovalidateMode.onUserInteraction,
          //     validator: (val) {
          //       if (val!.isEmpty) {
          //         return "please enter a valid 5-digit roll no";
          //       }
          //       if (val.length != 5 || int.tryParse(val) == null) {
          //         return "please enter a valid 5-digit roll no";
          //       }
          //       return null;
          //     },
          //     onSaved: (val) {
          //       rollVal = val.toString();
          //     },
          //     textInputAction: TextInputAction.done,
          //     cursorColor: kPrimaryColor,
          //     decoration: const InputDecoration(
          //       hintText: "Roll No",
          //       prefixIcon: Padding(
          //         padding: EdgeInsets.all(defaultPadding),
          //         child: Icon(Icons.lock),
          //       ),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter your phone number";
                }
                if (int.tryParse(val) == null) {
                  return "Please enter valid phone number";
                }
                if (val.length < 10) {
                  return "Please enter valid phone number";
                }
                return null;
              },
              onSaved: (val) {
                phoneVal = val;
              },
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Phone",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.smartphone_rounded),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter your email address";
                }
                final RegExp emailRegex =
                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(val)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
              onSaved: (val) {
                emailVal = val;
              },
              textInputAction: TextInputAction.done,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "email",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.email),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: pass,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please enter password";
                }
                return null;
              },
              textInputAction: TextInputAction.done,
              obscureText: showPass ? false : true,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: passcnf,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please confirm password";
                }
                if (pass.text != passcnf.text) {
                  return "password not matching";
                }
                return null;
              },
              onSaved: (val) {
                passVal = val.toString().trim();
              },
              textInputAction: TextInputAction.done,
              obscureText: showPass ? false : true,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: "confirm your password",
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      showPass = !showPass;
                    });
                  },
                  // padding: EdgeInsets.all(defaultPadding),
                  child: Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: Icon(
                      Icons.remove_red_eye,
                      color: showPass ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                postData();
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     fetchTodos();
          //   },
          //   child: Text("Get data".toUpperCase()),
          // ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginScreen();
                }));
              })
        ]));
  }
}
