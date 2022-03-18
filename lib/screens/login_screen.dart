import 'package:cuevan_app/utilities/redirect_login.dart';
import 'package:cuevan_app/widgets/input_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';

import '../utilities/validaciones.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Lottie.asset('assets/animations/login.json'),
              const Text('Login ✨',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
              Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    'Welcome back!',
                    style: Theme.of(context).textTheme.caption,
                  )),
              const _LoginForm(),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Register',
                      ),
                    ),
                    height: 50,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                    FocusScope.of(context).unfocus();
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xff2C3E50)),
                      elevation: MaterialStateProperty.all(0)),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final formKey = GlobalKey<FormState>();
  validator() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      print("object");
    } else {
      print(" sssss");
    }
  }

  Map<String, dynamic> formValues = {
    'email': '',
    'password': '',
  };
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputField(
            hintText: 'Username',
            sufixIcon: Icons.account_circle,
            obscureText: false,
            onSaved: (String? value) {
              formValues['email'] = value;
            },
            validator: (String? value) => Validaciones.emptycase(value),
          ),
          const SizedBox(
            height: 10,
          ),
          InputField(
            hintText: 'Password',
            sufixIcon: Icons.account_circle,
            obscureText: true,
            onSaved: (String? value) {
              formValues['password'] = value;
            },
            validator: (String? value) => Validaciones.emptycase(value),
          ),
          Container(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Recover Password',
                style: Theme.of(context).textTheme.caption,
              )),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              child: const SizedBox(
                width: double.infinity,
                child: Center(child: Text('Login')),
                height: 50,
              ),
              onPressed: () async {
                formKey.currentState?.save();
                validator();
                print(formValues['email']);
                await _signIn(formValues['email'], formValues['password']);
                //Navigator.pushNamed(context, 'admin_home');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                elevation: MaterialStateProperty.all(0),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Center(
                child: Text('Or'),
              )),
        ],
      ),
    );
  }

  Future _signIn(String email1, String password1) async {
    //metodo para el register
    FocusScope.of(context).unfocus();
    try {
      var credenciales = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email1, password: password1
              // ignore: avoid_print
              );
      final route =
          await RedirectLogin.redirectFromLogin(credenciales.user?.uid);

      Navigator.pushNamed(context, route); //usercredentials

    } on FirebaseAuthException catch (exception) {
      print('perro${exception.code}');
      switch (exception.code) {
        case 'invalid-email': //show alertDialog cuando el email ya esté en uso
          Fluttertoast.showToast(
              msg: "El correo no se encuentra registrado 😴😫",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              fontSize: 16.0);
          break;
        case 'wrong-password':
          Fluttertoast.showToast(
              msg: "La contraseña es incorrecta😴😫",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Theme.of(context).primaryColor,
              textColor: Colors.white,
              fontSize: 16.0);
          break;
      }
    }
  }
}
