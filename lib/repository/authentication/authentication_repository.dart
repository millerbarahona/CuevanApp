import 'dart:async';
import 'dart:ffi';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'models/user.dart';

//cuando ocurre error al registrarse
class SignUpFailure implements Exception {}

//cuando ocurre error en el logeo
class LoginWithEmailAndPasswordFailure implements Exception {}

//cuando ocurre un error al cerrar sesion
class LogOutFailure implements Exception {}

class AuthenticationRepository {
  AuthenticationRepository({required firebase_auth.FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  //actual usuario cuando el estado de auteticacion cambia
  Stream<User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      // ignore: unnecessary_null_comparison
      return firebaseUser == null ? User.empty : firebaseUser.toUser;
    });
  }

//Registrar usuario con email y password
  Future<void> signUp({required String email, required String password}) async {
    assert(email != null && password != null);
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on Exception {
      throw SignUpFailure();
    }
  }

  //Login con email y password
  Future<void> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    assert(email != null && password != null);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on Exception {
      throw LoginWithEmailAndPasswordFailure();
    }
  }
  //Cerrar sesión

  Future<void> logOut() async {
    try {
      await Future.wait([_firebaseAuth.signOut()]);
    } on Exception {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(email: email, id: uid, name: displayName, photo: photoURL);
  }
}
