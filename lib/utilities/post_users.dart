import 'dart:convert';

import 'package:cuevan_app/models/list_users_model.dart';
import 'package:cuevan_app/models/user_model.dart';
import 'package:dio/dio.dart';

class PostUser {
  static postUser( nombre, fechaNacimiento, email, firebaseUid) async{
    final dio = Dio();

    final userToSend = {
      "name": nombre,
      "birth_date": fechaNacimiento,
      "email": email,
      "role": "user",
      "firebase_uid": firebaseUid
    };

    final response = await dio.post('https://cuevanapp-backend.herokuapp.com/insertuser', data: json.encode(userToSend));
    final responseJson = json.encode(response.data);
  }

  static getUserUid(String uid) async{
    final dio = Dio();

    final userToSend = {
      "id": uid
    };

    final response = await dio.post('https://cuevanapp-backend.herokuapp.com/getsingleuser', data: json.encode(userToSend));
    final responseJson = json.encode(response.data);
    final User user = User.fromJson(responseJson);
    
    return user;
  }

}