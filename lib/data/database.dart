import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];
  final _myBox = Hive.box('Mybox');
  //
  void createInitialData() {
    todoList = [
      ['make Breakfast', false],
      ['Do exercise', false]
    ];
  }

  void loadData() {
    todoList = _myBox.get('TODOLIST');
  }

  void update() {
    _myBox.put('TODOLIST', todoList);
  }
}
