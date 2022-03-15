class UserModel {
  final String? name;
  final String? surname;
  final String? email;
  final String? password;
  final DateTime? birthdate;

  UserModel(
      {required this.name,
      required this.surname,
      required this.email,
      required this.password,
      required this.birthdate});
}
