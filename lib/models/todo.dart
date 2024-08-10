import 'package:flutter/material.dart';

class Todolist extends StatelessWidget {
  final String text;
  final Function(bool?)? onchange;
  final bool valuechek;
  final VoidCallback deletbutton;
  const Todolist(
      {super.key,
      required this.text,
      required this.deletbutton,
      required this.onchange,
      required this.valuechek});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        height: 70,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 255, 255, 255)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(children: [
                Checkbox(
                  value: valuechek,
                  onChanged: onchange,
                  activeColor: const Color.fromARGB(255, 66, 248, 0),
                  focusColor: const Color.fromARGB(255, 0, 0, 0),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(text),
              ]),
            ),
            //icon button for delet todo
            IconButton(
                onPressed: deletbutton,
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromARGB(255, 255, 0, 0),
                ))
          ],
        ),
      ),
    );
  }
}
