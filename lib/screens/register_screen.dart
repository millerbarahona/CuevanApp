import 'package:cuevan_app/widgets/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_rounded, size: 45),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 25, bottom: 10),
                    height: 100,
                    child: Center(
                        child:
                            Lottie.asset('assets/animations/register.json'))),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  child: const Text('Register',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30)),
                ),
                const _RegisterForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  DateTime _selectedDate = DateTime.now();
  String? _surname;
  String? _name;
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(right: 5),
                  child: InputField(
                    hintText: 'Name',
                    obscureText: false,
                    onSaved: (String? value) {
                      value = _name;
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: InputField(
                    hintText: 'Surname',
                    obscureText: false,
                    onSaved: (String? value) {
                      value = _surname;
                    },
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: InputField(
              hintText: 'Email',
              obscureText: false,
              onSaved: (String? value) {
                value = _email;
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: InputField(
              hintText: 'Password',
              obscureText: true,
              onSaved: (String? value) {
                value = _password;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff2C3E50)),
                  elevation: MaterialStateProperty.all(0)),
              child: const Text('Date of Birth'),
              onPressed: () => _presentDatePicker(),
            ),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(top: 10),
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xffa239f1)),
                  elevation: MaterialStateProperty.all(0)),
              child: const Text('Register'),
              onPressed: () async {
                print('este es el email `$_email`');
                await users.add(
                  {
                    'name': _name,
                    'surname': _surname,
                    'email': _email,
                    'password': _password,
                    'birthdate': _selectedDate,
                  },
                ).then((value) => print(_email));
              },
            ),
          )
        ],
      ),
    );
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }
}
