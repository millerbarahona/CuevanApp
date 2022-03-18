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

  final int id;
  final String nombre;
  final DateTime fechaNacimiento;
  final String correo;
  final String rol;
  final String firebaseUid;

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
