import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 20.0),
              child: const Divider()),
        ),
        const Text("Or"),
        Expanded(
          child: Container(
              margin: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: const  Divider()),
        ),
        ]),
    );
  }
}