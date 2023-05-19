class LoginStatus {
  static const String LOGKEY = "login";
  static const String id = "id";
  static const String name = "name";
  static const String department = "department";
  static const String semester = "semester";
  static const String classroom = "classroom";
  static const String mobileNum = "mobileNum";
  static const String rollNo = "rollNo";
  static const String email = "email";
}

class User_Model {
  final String id;
  final String name;
  final String department;
  final String semester;
  final String classroom;
  final String mobileNum;
  final int rollNo;
  final String email;

  User_Model({
    required this.id,
    required this.name,
    required this.department,
    required this.semester,
    required this.classroom,
    required this.mobileNum,
    required this.rollNo,
    required this.email,
  });

  User_Model.fromJson(Map<String, dynamic> json)
      : id= json["_id"],
        name= json["name"],
        department= json["department"],
        semester= json["semister"],
        classroom= json["classroom"],
        mobileNum= json["mobileNum"],
        rollNo= json["rollNo"],
        email= json["email"];


  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "department": department,
        "semister": semester,
        "classroom": classroom,
        "mobileNum": mobileNum,
        "rollNo": rollNo,
        "email": email,
        

      };
}

// class ProfileModel {
//   static List<UserProfile> users = [
//     UserProfile(
//       id: "645f500a24b7b63e2320e215",
//       name: "jeff bezos",
//       department: "CS",
//       semester: "644568bf76fe16f933da4c70",
//       classroom: "644e18036a01e893ee2470c4",
//       mobileNum: "1234432123",
//       rollNo: 21333,
//       email: "jeff@yahoo.in",
//     )
//   ];
// }

// class UserProfile {
//   final String id;
//   final String name;
//   final String department;
//   final String semester;
//   final String classroom;
//   final String mobileNum;
//   final int rollNo;
//   final String email;
//   UserProfile({
//     required this.id,
//     required this.name,
//     required this.department,
//     required this.semester,
//     required this.classroom,
//     required this.mobileNum,
//     required this.rollNo,
//     required this.email,
//   });
//   factory UserProfile.fromMap(Map<String, dynamic> map) {
//     return UserProfile(
//         id: map["_id"],
//         //  id: "645f500a24b7b63e2320e215",
//         name: map["name"],
//         department: map["department"],
//         semester: map["semister"],
//         classroom: map["classroom"],
//         mobileNum: map["mobileNum"],
//         rollNo: map["rollNo"],
//         email: map["email"]);
//   }

//   toMap() => {
//         "_id": id,
//         "name": name,
//         "department": department,
//         "semister": semester,
//         "classroom": classroom,
//         "mobileNum": mobileNum,
//         "rollNo": rollNo,
//         "email": email,
//       };
// }
