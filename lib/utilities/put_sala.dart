import 'dart:convert';

import 'package:cuevan_app/models/list_salas_model.dart';
import 'package:dio/dio.dart';

class PutSalas {
  static putSalas(int id, String numero, int cineId) async {
    final dio = Dio();
    final response = await dio.put(
      'https://cuevanapp-backend.herokuapp.com/updatesala',
      data: {"id": id, "numero_sala": numero, "cines_id": cineId},
    );
    print(response);
    final responseJson = json.encode(response.data);
  }
}
