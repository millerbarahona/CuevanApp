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
        child: SingleChildScrollView(
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
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Text('Welcome back!', style: Theme.of(context).textTheme.caption,)
                  ),
                  const _LoginForm(),
                  Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: ElevatedButton(
                      child: const SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Register',),),
                        height: 50,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, 'register');
                        FocusScope.of(context).unfocus();
                      },
                      style: ButtonStyle(         
                        shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff2C3E50)),
                        elevation: MaterialStateProperty.all(0)
                      ),
                      ),
                  ),
               ]
            ),
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
          const InputField(hintText: 'Username', sufixIcon: Icons.account_circle, obscureText: false),
          const SizedBox(height: 10,),
          const InputField(hintText: 'Password', sufixIcon: Icons.account_circle, obscureText: true,),
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
                height: 50,
              ),
              onPressed: () {
                
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffa239f1)),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                ),
                elevation: MaterialStateProperty.all(0)
              ),
              ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: const Center(child: Text('Or'),)
          ),          
        ],
      ),
    );
  }
}

class _GoogleBtn extends StatelessWidget {
  const _GoogleBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: ElevatedButton(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(                    
                child: const Image(image: AssetImage('assets/images/google.png'), height: 40, width: 40,),
                borderRadius: BorderRadius.circular(10),
              ),
              Container(padding: const EdgeInsets.only(left: 10),child: const Text('Continue with Google', style: TextStyle(color: Colors.black),))
            ]
            ),
        ),
        onPressed: () {

        },              
        style: ButtonStyle(         
          shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFE85E4)),
          side: MaterialStateProperty.all( const BorderSide(color: Color(0xffaeb1b6))),
          elevation: MaterialStateProperty.all(0)
        ),
        ),
    );
  }
}