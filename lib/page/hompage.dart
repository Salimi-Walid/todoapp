import 'package:flutter/material.dart';
import 'package:todoapp/models/textfaild.dart';
import 'package:todoapp/models/todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List mytodo = [
    ['anjib lkhedra'],
    ['nhwi somiya']
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Flotactionbutton
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Add My Todo'),
                  content: Textfaildadd(
                    //controler: ,
                    textInput: TextInputType.text,
                    hinttext: 'Add My Todo',
                  ),
                  actions: [],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      // backgrand
      backgroundColor: const Color.fromARGB(255, 255, 235, 133),
      // My appbar
      appBar: AppBar(
        title: const Text('My Todo'),
      ),
      //My bady
      body: Padding(
        padding: const EdgeInsets.all(15),
        // My listview to show my todo
        // and code in file models/Todolist
        child: ListView.builder(
          itemCount: mytodo.length,
          itemBuilder: (context, index) => Todolist(
            text: mytodo[index][0],
          ),
        ),
      ),
    );
  }
}
