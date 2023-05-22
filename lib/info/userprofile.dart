import 'package:qrollcall/info/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profileuser {
  String status = " ";
  ExistingUser existingUser = ExistingUser();
  String? token;

  profileuser({required this.status, required this.existingUser, this.token});

  profileuser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    existingUser = new ExistingUser.fromJson(json['existingUser']);
    // existingUser = json['existingUser'] != null
    //     ? new ExistingUser.fromJson(json['existingUser'])
    //     : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.existingUser != null) {
      data['existingUser'] = this.existingUser!.toJson();
    }
    data['token'] = this.token;
    return data;
  }

  void savedata() async {
    var sharedpref = await SharedPreferences.getInstance();
    await sharedpref.setString(LoginStatus.name, existingUser.name);
    await sharedpref.setString(LoginStatus.id, existingUser.sId);
    await sharedpref.setString(LoginStatus.classroom, existingUser.classroom);
    await sharedpref.setString(LoginStatus.department, existingUser.department);
    await sharedpref.setString(LoginStatus.semester, existingUser.semister);
    await sharedpref.setString(LoginStatus.mobileNum, existingUser.mobileNum);
    await sharedpref.setInt(LoginStatus.rollNo, existingUser.rollNo);
    await sharedpref.setString(LoginStatus.email, existingUser.email);
  }
}

class ExistingUser {
  String sId = "A";
  String name = "";
  String department = "";
  String semister = "";
  String classroom = "";
  String mobileNum = "";
  int rollNo = 0;
  String email = "";
  String password = "";
  int iV = 0;

  ExistingUser(
      {this.sId = "A",
      this.name = "",
      this.department = "",
      this.semister = "",
      this.classroom = "",
      this.mobileNum = "",
      this.rollNo = 0,
      this.email = "",
      this.password = "",
      this.iV = 0});

  ExistingUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    department = json['department'];
    semister = json['semister'];
    classroom = json['classroom'];
    mobileNum = json['mobileNum'];
    rollNo = json['rollNo'];
    email = json['email'];
    password = json['password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['department'] = this.department;
    data['semister'] = this.semister;
    data['classroom'] = this.classroom;
    data['mobileNum'] = this.mobileNum;
    data['rollNo'] = this.rollNo;
    data['email'] = this.email;
    data['password'] = this.password;
    data['__v'] = this.iV;
    return data;
  }
}



// class profileuser {
//   String status=" ";
//   Data data = Data();

//   profileuser({required this.status,required this.data});

//   profileuser.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     // data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     data = new Data.fromJson(json['data']);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }

//   void savedata() async {

//     var sharedpref = await SharedPreferences.getInstance();
//     await sharedpref.setString(LoginStatus.name,data.name);
//     await sharedpref.setString(LoginStatus.id,data.sId);
//     await sharedpref.setString(LoginStatus.classroom,data.classroom);
//     await sharedpref.setString(LoginStatus.department,data.department);
//     await sharedpref.setString(LoginStatus.semester,data.semister);
//     await sharedpref.setString(LoginStatus.mobileNum,data.mobileNum);
//     await sharedpref.setInt(LoginStatus.rollNo,data.rollNo);
//     await sharedpref.setString(LoginStatus.email,data.email);
//   }
// }

// class Data {
//   String sId = "A";
//   String name = "";
//   String department = "";
//   String semister = "";
//   String classroom = "";
//   String mobileNum = "";
//   int rollNo = 0;
//   String email = "";
//   String password = "";
//   int iV = 0;

//   Data(
//       {this.sId = "A",
//       this.name = "",
//       this.department = "",
//       this.semister = "",
//       this.classroom = "",
//       this.mobileNum = "",
//       this.rollNo = 0,
//       this.email = "",
//       this.password = "",
//       this.iV = 0});

//   Data.fromJson(Map<String, dynamic> json) {
//     sId = json['_id'];
//     name = json['name'];
//     department = json['department'];
//     semister = json['semister'];
//     classroom = json['classroom'];
//     mobileNum = json['mobileNum'];
//     rollNo = json['rollNo'];
//     email = json['email'];
//     password = json['password'];
//     iV = json['__v'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['_id'] = this.sId;
//     data['name'] = this.name;
//     data['department'] = this.department;
//     data['semister'] = this.semister;
//     data['classroom'] = this.classroom;
//     data['mobileNum'] = this.mobileNum;
//     data['rollNo'] = this.rollNo;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     data['__v'] = this.iV;
//     return data;
//   }
// }
