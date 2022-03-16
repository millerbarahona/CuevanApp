import 'dart:convert';

class Pelicula {
  Pelicula({
    required this.id,
    required this.nombre,
    required this.sipnosis,
    required this.clacificacionId,
    required this.directorId,
    required this.generoId,
    required this.imageUrl,
  });

  int id;
  String nombre;
  String sipnosis;
  int clacificacionId;
  int directorId;
  int generoId;
  String imageUrl;

  factory Pelicula.fromJson(String str) => Pelicula.fromMap(json.decode(str));

  factory Pelicula.fromMap(Map<String, dynamic> json) => Pelicula(
        id: json["id"],
        nombre: json["nombre"],
        sipnosis: json["sipnosis"],
        clacificacionId: json["clacificacion_id"],
        directorId: json["director_id"],
        generoId: json["genero_id"],
        imageUrl: json["image_url"],
      );
}
