import 'dart:convert';

class User {
  User({
    required this.id,
    required this.nombre,
    required this.fechaNacimiento,
    required this.correo,
    required this.rol,
    required this.firebaseUid,
  });

  int id;
  String nombre;
  DateTime fechaNacimiento;
  String correo;
  String rol;
  String firebaseUid;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        nombre: json["nombre"],
        fechaNacimiento: DateTime.parse(json["fecha_nacimiento"]),
        correo: json["correo"],
        rol: json["rol"],
        firebaseUid: json["firebase_uid"],
      );
}
