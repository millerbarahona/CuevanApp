import 'package:cuevan_app/widgets/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterScreen extends StatelessWidget {
   
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  height: 100,
                  child: Center(child: Lottie.asset('assets/animations/register.json'))
                ),
                const _RegisterForm()
              ],
            ),
          ),
        ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [          
          Row(
            children:  [
              Flexible(child:  Container(padding: const EdgeInsets.only(right: 5),child: const InputField(hintText: 'Name', obscureText: false))),
              Flexible(child: Container( padding: const EdgeInsets.only(left: 5),child: const InputField(hintText: 'Surname', obscureText: false))),
            ],
          ),
          Container( padding: const EdgeInsets.only(top: 10), child: const InputField(hintText: 'Email', obscureText: false))
        ],
      ),
    );
  }
}