import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Validaciones {
  static emptycase(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo vacio ';
    }
    return null;
  }

  static validemail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo vacio ';
    } else {
      bool isvalidemail = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(value);
      if (isvalidemail != true) {
        Fluttertoast.showToast(
            msg: "El correo no es valido",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  static validpassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Campo vacio ';
    } else {
      bool isvalidemail = RegExp(r"^(?=\w*\d)(?=\w*[A-Z])(?=\w*[a-z])\S{8,16}$")
          .hasMatch(value);
      if (isvalidemail != true) {
        Fluttertoast.showToast(
            msg: "La contraseña es demasiado facil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
