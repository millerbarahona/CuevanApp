import 'dart:convert';

import 'package:cuevan_app/models/salas_model.dart';

class ListSalas {
  ListSalas({
    required this.salas,
  });

  List<Sala> salas;

  factory ListSalas.fromJson(String str) => ListSalas.fromMap(json.decode(str));

  factory ListSalas.fromMap(Map<String, dynamic> json) => ListSalas(
        salas: List<Sala>.from(json["salas"].map((x) => Sala.fromMap(x))),
      );
}
