import 'package:flutter/material.dart';

class Todolist extends StatelessWidget {
  final String text;
  final VoidCallback deletbutton;
  const Todolist({super.key, required this.text, required this.deletbutton});
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.list),
            const SizedBox(
              width: 20,
            ),
            Text(text),
            const SizedBox(
              width: 260,
            ),
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
