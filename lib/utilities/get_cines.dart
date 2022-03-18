import 'dart:convert';

import 'package:cuevan_app/models/list_cines_model.dart';
import 'package:dio/dio.dart';

class GetCines {

  static getCines() async {    
    final dio = Dio();
    //final url = Uri.http( baseUrl, 'getusers', {});

    final response = await dio.get('https://cuevanapp-backend.herokuapp.com/getcines');
    final responseJson = json.encode(response.data);
    final ListCines listCines = ListCines.fromJson(responseJson);
    
    return listCines;
  }
}