import 'package:flutter/material.dart';
import 'package:todoapp/models/textfaild.dart';
import 'package:todoapp/models/todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController noteaddd = TextEditingController();
  // my list todo
  List mytodo = [
    ['anjib lkhedra'],
    ['nhwi somiya']
  ];
  void onadd() {
    setState(() {
      mytodo.add([noteaddd.text]);
      noteaddd.clear();
    });
  }

  void deletetodo(int index) {
    setState(() {
      mytodo.removeAt(index);
    });
  }

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
                    controler: noteaddd,
                    textInput: TextInputType.text,
                    hinttext: 'Add My Todo',
                  ),
                  actions: [
                    TextButton(onPressed: onadd, child: const Text('Add'))
                  ],
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
            deletbutton: () => deletetodo(index),
            text: mytodo[index][0],
          ),
        ),
      ),
    );
  }
}
