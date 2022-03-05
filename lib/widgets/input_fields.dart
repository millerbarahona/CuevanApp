import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({ Key? key, required this.hintText, required this.sufixIcon, required this.obscureText }) : super(key: key);

  final String hintText;
  final IconData sufixIcon;
  final bool obscureText; 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        
        filled: true,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(150, 151, 157, 1),
        ),
        fillColor: const Color.fromRGBO(244, 239, 248, 1),
        prefixIcon: Icon(sufixIcon,color: const Color(0xffa239f1),),
        suffixIcon: obscureText ? const Icon(Icons.remove_red_eye, color:Color(0xffb0b0b4),) : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromRGBO(245, 244, 247, 1))
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xffa239f1), width: 2)
        )
      ),
    );
  }
}