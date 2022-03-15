import 'package:cuevan_app/screens/cinema_screen.dart';
import 'package:cuevan_app/screens/login_screen.dart';
import 'package:cuevan_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static Map<String, Widget Function (BuildContext)> getRoutes() {
    return {
      'login': (BuildContext context) => const LoginScreen(),
      'register': (BuildContext context) => const RegisterScreen(),
      'home_page': (BuildContext context) => const CinemaScreen()
    };
  }
}