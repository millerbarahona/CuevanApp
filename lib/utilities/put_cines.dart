import 'dart:convert';

import 'package:cuevan_app/models/cines_model.dart';
import 'package:cuevan_app/models/list_salas_model.dart';
import 'package:dio/dio.dart';

class Putcines {
  static putCines(int id, String nombre, Cine cine) async {
    final dio = Dio();
    final response = await dio.put(
      'https://cuevanapp-backend.herokuapp.com/updatecines',
      data: {
        "id": id, 
        "nombre": nombre, 
        "telefono": cine.telefono,
        "direccion": cine.direccion,
        "image_url": cine.imageUrl
        },
    );
    print(response);
    final responseJson = json.encode(response.data);
  }
}