import 'dart:convert';

class Sala {
  Sala({
    required this.id,
    required this.numeroSala,
    required this.cinesId,
  });

  int id;
  String numeroSala;
  int cinesId;

  factory Sala.fromJson(String str) => Sala.fromMap(json.decode(str));

  factory Sala.fromMap(Map<String, dynamic> json) => Sala(
        id: json["id"],
        numeroSala: json["numero_sala"],
        cinesId: json["cines_id"],
      );
}