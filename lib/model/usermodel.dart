import 'package:mongo_dart/mongo_dart.dart';

class User {
  final ObjectId? id;
  final String fullname;
  final String username;
  final String password;

  const User(
      {this.id,
      required this.fullname,
      required this.username,
      required this.password});
  Map<String, dynamic> toMap() => {
        "fullname": fullname,
        "username": username,
        "password": password,
      };
}
