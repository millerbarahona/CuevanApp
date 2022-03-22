import 'dart:convert';

class ListRoomsCines {
    ListRoomsCines({
        required this.salas,
    });

    List<SalaCine> salas;

    factory ListRoomsCines.fromJson(String str) => ListRoomsCines.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ListRoomsCines.fromMap(Map<String, dynamic> json) => ListRoomsCines(
        salas: List<SalaCine>.from(json["salas"].map((x) => SalaCine.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "salas": List<dynamic>.from(salas.map((x) => x.toMap())),
    };
}

class SalaCine {
    SalaCine({
        required this.id,
        required this.numeroSala,
        required this.nombre,
        required this.id_cine,
    });

    int id;
    String numeroSala;
    String nombre;
    int id_cine;

    factory SalaCine.fromJson(String str) => SalaCine.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SalaCine.fromMap(Map<String, dynamic> json) => SalaCine(
        id: json["id"],
        numeroSala: json["numero_sala"],
        nombre: json["nombre"],
        id_cine: json["id_cine"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "numero_sala": numeroSala,
        "nombre": nombre,
        "id_cine": id_cine,
    };
}
