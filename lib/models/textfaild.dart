import 'package:flutter/material.dart';

class Textfaildadd extends StatelessWidget {
  final TextEditingController? controler;
  final TextInputType? textInput;
  final String hinttext;
  const Textfaildadd(
      {super.key,
      required this.controler,
      required this.hinttext,
      required this.textInput});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 8),
      width: 308,
      height: 52,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 252, 251, 249),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: controler,
        keyboardType: textInput,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: const TextStyle(fontSize: 22),
            border: InputBorder.none),
      ),
    );
  }
}
