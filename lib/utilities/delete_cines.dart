import 'dart:convert';

import 'package:dio/dio.dart';

class DeleteCines {
  
  static deleteCines(int id) async{
    final dio = Dio();    

    final response = await dio.delete('http://192.168.0.8:4000/deletecines', data: json.encode({"id": id}));
    final responseJson = json.encode(response.data);
  }
}