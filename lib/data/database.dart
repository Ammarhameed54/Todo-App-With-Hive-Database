import 'package:hive/hive.dart';

class TodoDatabase {
  List toDolist = [];

  // reference of the Box

  final mybox = Hive.box("mybox");

  // Run this if the User Ever opening the App for  the First Time

  void createInitialTask() {
    toDolist = [
      ["Add Task", false],
      ["Swipe Left To Delete Task", false],
    ];
  }


  // Load the Data From the Database

  void loadData(){
    toDolist = mybox.get("TODOLIST");
  }



  // Update the Database

  void updateDatabase(){
   mybox.put("TODOLIST", toDolist);
  }
}
