import 'package:cuevan_app/widgets/divider.dart';
import 'package:cuevan_app/widgets/input_fields.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Lottie.asset('assets/animations/login.json'),
                const Text('Login ✨', style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                )),
                const SizedBox(height: 10,),
                Text('Welcome back!', style: Theme.of(context).textTheme.caption,),
                const SizedBox(height: 20,),
                const _LoginForm(),
                
             ]
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          const InputField(hintText: 'Username', sufixIcon: Icons.account_circle,),
          const SizedBox(height: 10,),
          const InputField(hintText: 'Password', sufixIcon: Icons.account_circle,),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: Text('Recover Password', style: Theme.of(context).textTheme.caption,)
          ),

          Container(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(                          
              child: const SizedBox(
                width: double.infinity,
                child: Center(child: Text('Login')),
                height: 40,
              ),
              onPressed: () {

              },
              style: ButtonStyle(                            
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffa239f1)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                )
              ),                          
              ),
          ),
          const CustomDivider(),
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: ElevatedButton(                          
              child: const SizedBox(
                width: double.infinity,
                child: Center(child: Text('Register')),
                height: 40,
              ),
              onPressed: () {

              },
              style: ButtonStyle(                            
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFD9441)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                )
              ),                          
              ),
          )
        ],
      ),
    );
  }
}