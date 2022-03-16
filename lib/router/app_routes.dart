import 'package:cuevan_app/screens/admin_home.dart';
import 'package:cuevan_app/screens/admin_users_screen.dart';
import 'package:cuevan_app/screens/login_screen.dart';
import 'package:cuevan_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'login';

  static Map<String, Widget Function (BuildContext)> getRoutes() {
    return {
      'login': (BuildContext context) => const LoginScreen(),
      'register': (BuildContext context) => const RegisterScreen(),
      'admin_home': (BuildContext context) => const AdminHomeScreen(),
      'admin_users':(BuildContext context) => const AdminUsersScreen()
    };
  }
}