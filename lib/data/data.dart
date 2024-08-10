import 'package:hive_flutter/hive_flutter.dart';

class Mydata {
  // referance the box
  final mybox = Hive.box('todobox');
  // my list todo
  List mytodo = [];
  // the first time open application
  void createnitialdata() {
    mytodo = [
      ['Add My Todo', false]
    ];
  }

  //
  void loadData() {
    mytodo = mybox.get('MYTODO');
  }

  //
  void updatedData() {
    mybox.put('MYTODO', mytodo);
  }
}
