import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:qrollcall/components/login_screen.dart';
import 'package:qrollcall/info/userprofile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../info/profile.dart';
import '../pages/homepage.dart';
import 'already_have_an_account_check.dart';
import 'package:qrollcall/constants.dart';
import 'signUp_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String? emailVal;
  String? passVal;
  bool showPass = false;

  final _formKey = GlobalKey<FormState>();

  void saveuser_data(Response response) async {
    final userlogJson = response.body;
    print(userlogJson);
    Map<String, dynamic> userMap = jsonDecode(userlogJson);
    var user = profileuser.fromJson(userMap);

    print('Howdy, ${user.existingUser?.name}!');

    print('We sent the verification link to ${user.existingUser?.email}.');
    user.savedata();
    print("Data saved successdully!");
  }

  getData() async {
    var sharedpref = await SharedPreferences.getInstance();
    try {
      print("$emailVal $passVal");
      // var headers = {"Content-Type": "application/json"};

      var response = await http.post(
        Uri.parse("https://q-roll-backend.onrender.com/api/v1/studentlogin"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{"email": "$emailVal", "password": "$passVal"}),
      );

      // var body = json.encode({"email": "$emailVal", "password": "$passVal"});

      // var response = await http
      //     .post(Uri.parse("http://192.168.0.1:5000/api/v1/studentlogin"),
      //         headers: headers,
      //         body: {"email": "$emailVal", "password": "$passVal"});
      print("Requested...");

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        //login success
        saveuser_data(response);

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
      //print(response.body);
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Container(
          child: Text("Something went wrong!"),
        ),
        behavior: SnackBarBehavior.floating,
      ));
      // const LoginScreen().bringmessenger("Something went wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (val) {
                if (val!.isEmpty) {
                  return "Enter valid email address";
                }
                final RegExp emailRegex =
                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegex.hasMatch(val)) {
                  return "Please enter a valid email address";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              onSaved: (email) {
                emailVal = email;
              },
              decoration: const InputDecoration(
                hintText: "Your email",
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
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
                onSaved: (val) {
                  passVal = val;
                },
                textInputAction: TextInputAction.done,
                obscureText: showPass ? false : true,
                cursorColor: kPrimaryColor,
                decoration: InputDecoration(
                  hintText: "Your password",
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
            const SizedBox(height: defaultPadding),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    getData();
                  }
                },
                child: Text(
                  "Login".toUpperCase(),
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
