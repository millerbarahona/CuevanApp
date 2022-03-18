import 'dart:convert';

import 'package:cuevan_app/models/list_peliculas_model.dart';
import 'package:dio/dio.dart';

class GetPeliculas {

  static getPeliculas() async {
    final dio = Dio();
    //final url = Uri.http( baseUrl, 'getusers', {});

    final response = await dio.get('https://cuevanapp-backend.herokuapp.com/getpeliculas');
    final responseJson = json.encode(response.data);
    final ListPeliculas listCines = ListPeliculas.fromJson(responseJson);
    
    return listCines;
  }
}