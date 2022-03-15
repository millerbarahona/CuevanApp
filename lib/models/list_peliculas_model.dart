// To parse this JSON data, do
//
//     final listCines = listCinesFromMap(jsonString);

import 'dart:convert';

import 'package:cuevan_app/models/pelicula_model.dart';

class ListPeliculas {
    ListPeliculas({
      required this.peliculas,
    });

    List<Pelicula> peliculas;

    factory ListPeliculas.fromJson(String str) => ListPeliculas.fromMap(json.decode(str));    

    factory ListPeliculas.fromMap(Map<String, dynamic> json) => ListPeliculas(
        peliculas: List<Pelicula>.from(json["peliculas"].map((x) => Pelicula.fromMap(x))),
    );
}


