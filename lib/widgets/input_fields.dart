import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({ Key? key, required this.hintText, required this.sufixIcon }) : super(key: key);

  final String hintText;
  final IconData sufixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(150, 151, 157, 1),
        ),
        fillColor: const Color.fromRGBO(244, 239, 248, 1),
        prefixIcon: Icon(sufixIcon,color: const Color.fromRGBO(165, 69, 234, 1),),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromRGBO(245, 244, 247, 1))
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color.fromRGBO(165, 69, 234, 1), width: 2)
        )
      ),
    );
  }
}