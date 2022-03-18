import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hintText,
    this.sufixIcon,
    required this.obscureText,
    this.validator,
    this.onSaved,
    this.onChanged,
    this.keyboardType,
    this.initialValue,
    this.labelText,
  }) : super(key: key);

  final String hintText;
  final IconData? sufixIcon;
  final bool obscureText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final String? initialValue;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onSaved: onSaved,
      obscureText: obscureText,
      initialValue: initialValue,
      decoration: InputDecoration(
        label: labelText != null
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromRGBO(244, 239, 248, 1),
                ),
                child: Text(
                  labelText!,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ))
            : null,
        hintText: hintText,
        filled: true,
        hintStyle: const TextStyle(
          color: Color.fromRGBO(150, 151, 157, 1),
        ),
        fillColor: const Color.fromRGBO(244, 239, 248, 1),
        prefixIcon: sufixIcon != null
            ? Icon(
                sufixIcon,
                color: Theme.of(context).primaryColor,
              )
            : null,
        suffixIcon: obscureText
            ? const Icon(
                Icons.remove_red_eye,
                color: Color(0xffb0b0b4),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(
            color: Color.fromRGBO(245, 244, 247, 1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 2),
        ),
      ),
    );
  }
}
