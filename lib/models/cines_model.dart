import 'dart:convert';

class Cine {
  Cine({
    required this.id,
    required this.direccion,
    required this.telefono,
    required this.nombre,
    required this.imageUrl,
  });

  int id;
  String direccion;
  String telefono;
  String nombre;
  String imageUrl;

  factory Cine.fromJson(String str) => Cine.fromMap(json.decode(str));

  factory Cine.fromMap(Map<String, dynamic> json) => Cine(
        id: json["id"],
        direccion: json["direccion"],
        telefono: json["telefono"],
        nombre: json["nombre"],
        imageUrl: json["image_url"],
      );
}
