import 'dart:convert';

import 'package:cuevan_app/models/sala_cines_model.dart';
import 'package:dio/dio.dart';

class GetRoomsCines {

  static getRooms() async {
    final dio = Dio();
    //final url = Uri.http( baseUrl, 'getusers', {});

    final response = await dio.get('https://cuevanapp-backend.herokuapp.com/getsalascines');
    final responseJson = json.encode(response.data);
    final ListRoomsCines listCines = ListRoomsCines.fromJson(responseJson);
    
    return listCines;
  }
}