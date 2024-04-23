import 'package:flutter/material.dart';
import 'package:todo/util/todo_tile.dart';
import 'package:todo/util/dialog_box.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('Mybox');
  //controller
  final _controller = TextEditingController();

  //list of tasks
  TodoDatabase db = TodoDatabase();
  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void CheckBoxChanged(bool? value, int ind) {
    setState(() {
      db.todoList[ind][1] = !db.todoList[ind][1];
    });
    db.update();
  }

  void DeleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.update();
  }

  void saveNewTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.update();
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller1: _controller,
            oncancel: () => Navigator.of(context).pop(),
            onsave: saveNewTask,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[500],
        centerTitle: true,
        elevation: 0,
        title: Text('TO-DO'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createTask,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            name: db.todoList[index][0],
            done: db.todoList[index][1],
            onChanged: (value) => CheckBoxChanged(value, index),
            deleteFunc: (context) => DeleteTask(index),
          );
        },
      ),
    );
  }
}
