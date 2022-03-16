import 'dart:convert';

import 'package:cuevan_app/models/cines_model.dart';

class ListCines {
  ListCines({
    required this.cines,
  });

  List<Cine> cines;

  factory ListCines.fromJson(String str) => ListCines.fromMap(json.decode(str));

  factory ListCines.fromMap(Map<String, dynamic> json) => ListCines(
        cines: List<Cine>.from(json["cines"].map((x) => Cine.fromMap(x))),
      );
}
