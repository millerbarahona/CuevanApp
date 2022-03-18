import 'dart:convert';

import 'package:dio/dio.dart';

class DeleteCines {
  
  static deleteCines(int id) async{
    final dio = Dio();    

    final response = await dio.delete('https://cuevanapp-backend.herokuapp.com/deletecines', data: json.encode({"id": id}));
    final responseJson = json.encode(response.data);
  }
}