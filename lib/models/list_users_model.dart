import 'dart:convert';

import 'package:cuevan_app/models/user_model.dart';

class ListUsers {
  ListUsers({
    required this.users,
  });

  List<User> users;

  factory ListUsers.fromJson(String str) => ListUsers.fromMap(json.decode(str));

  factory ListUsers.fromMap(Map<String, dynamic> json) => ListUsers(
        users: List<User>.from(json["users"].map((x) => User.fromMap(x))),
      );
}