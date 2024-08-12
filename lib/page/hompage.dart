import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/data/data.dart';
import 'package:todoapp/models/textfaild.dart';
import 'package:todoapp/models/todo.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // referance hivebox
  final mybox = Hive.box('todobox');
  Mydata db = Mydata();
  @override
  void initState() {
    if (mybox.get('MYTODO') == null) {
      db.createnitialdata();
    } else {
      db.loadData();
    }
    super.initState();
  }

  // content of textfiald
  TextEditingController noteaddd = TextEditingController();
  // fonction for add todo
  void onadd() {
    if (noteaddd.text.isEmpty) {
    } else {
      setState(() {
        db.mytodo.add([noteaddd.text, false]);
        db.updatedData();
        noteaddd.clear();
      });
    }
  }

  // fonction for remove todo
  void deletetodo(int index) {
    setState(() {
      db.mytodo.removeAt(index);
      db.updatedData();
    });
  }

  //// fonction for change todo checkbox
  void onchange(bool? value, int index) {
    setState(() {
      db.mytodo[index][1] = !db.mytodo[index][1];
      db.updatedData();
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
                  content: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Textfaildadd(
                      controler: noteaddd,
                      textInput: TextInputType.text,
                      hinttext: 'Add My Todo',
                    ),
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
        backgroundColor: const Color.fromARGB(255, 167, 117, 9),
        title: const Center(child: Text('My Todo')),
      ),
      //My bady
      body: Padding(
        padding: const EdgeInsets.all(15),
        // My listview to show my todo
        // and code in file models/Todolist
        child: ListView.builder(
          itemCount: db.mytodo.length,
          itemBuilder: (context, index) => Todolist(
            onchange: (value) => onchange(value, index),
            valuechek: db.mytodo[index][1],
            deletbutton: () => deletetodo(index),
            text: db.mytodo[index][0],
          ),
        ),
      ),
    );
  }
}
