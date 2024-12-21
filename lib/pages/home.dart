import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/data/database.dart';
import 'package:todo/widgets/appbar.dart';
import 'package:todo/widgets/dialog_box.dart';
import 'package:todo/widgets/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // reference of the Box

  final mybox = Hive.box("mybox");
  // Textediting Controller for the Note Textfield
  final _controller = TextEditingController();

  // instance of the DataBase class to Handle the Data Members
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // if the user 1st time ever opening the app then create the default data

    if (mybox.get("TODOLIST") == null) {
      db.createInitialTask();
    } else {
      // there already exists Data
      db.loadData();
    }
    super.initState();
  }

  // checkBox onChanged / OnTap functon

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updateDatabase();
  }

  // Save the Task

  void saveTask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // delete the Task

  void deleteTask(int index) {
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updateDatabase();
  }

  // cretas a new Task

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveTask,
          onCancel: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appbar(width),
      body: ListView.builder(
        itemCount: db.toDolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDolist[index][0],
            taskCompleted: db.toDolist[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.orange,
        onPressed: () {
          createTask();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
