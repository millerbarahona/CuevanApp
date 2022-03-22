import 'dart:convert';

import 'package:cuevan_app/models/list_salas_model.dart';
import 'package:dio/dio.dart';

class DeleteSalas {
  
  static deleteSalas(int id) async{
    print(id);
    final dio = Dio();    
    final response = await dio.delete(
      'https://cuevanapp-backend.herokuapp.com/deletesala',
      data: {"id": id},
    );
    print(response);
    final responseJson = json.encode(response.data);
    final listUsers = ListSalas.fromJson(responseJson);

    var listSalas = listUsers.salas;
  }
}