class UserModel {
  static List<User> users = [
    User(
        id: 20,
        email: "janet.weaver@reqres.in",
        first_name: "Janet",
        last_name: "Weaver",
        avatar: "https://reqres.in/img/faces/2-image.jpg"),
  ];
}

class User {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;
  User({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map["id"],
        first_name: map["first_name"],
        last_name: map["last_name"],
        email: map["email"],
        avatar: map["avatar"]);
  }

  toMap() => {
        "id": id,
        "first_name": first_name,
        "last_name": last_name,
        "email": email,
        "avatar": avatar
      };
}
