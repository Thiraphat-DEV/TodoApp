import 'dart:async';
import 'package:flutter/material.dart';
import 'package:appflut/screens/todo_list.dart';
import 'package:appflut/models/todo.dart';
import 'package:appflut/util/database_helper.dart';
import 'package:appflut/screens/todo_Detail.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:core';
class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TodoListState();
  }
}
class TodoListState extends State<TodoList> {
  DatabaseHelper databaseHelper = DatabaseHelper();

  late List<Todo> todoList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if(todoList == null) {
      todoList = List<Todo>();
      updateListView();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('TodoList'),
      ),
      body: getTodoListView(), // get page todoList

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FAB clicked');
          navigateTodoDetail(Todo('', '', 2, ''), 'Add Todo');// change to page todoDetail

        },
        tooltip: 'Add Todo',
        child: Icon(Icons.add),
      ),
    );
  }

  ListView getTodoListView() {
    TextTheme accentTextTheme;
    return ListView.builder(
      itemCount:count,
      itemBuilder: (BuildContext context, int position) {
      return Card(
        color: Colors.white,
        elevation: 2.0,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: getPriorityColor(this.todoList[position].priority), // difference of color priority
            child: getPriorityIcon(this.todoList[position].priority), //change Icon of priority

          ),
          title: Text(this.todoList[position].date),

          trailing: GestureDetector(
            child: Icon(Icons.delete, color: Colors.red,),
            onTap: () {
              _delete(context, todoList[position]);
            },
          ), // click of button ?
            onTap:() {
            debugPrint('ListTile Taped');
            navigateTodoDetail(this.todoList[position], 'Edit Todo');
            } , //edit of todoList
        ),
      );
      }
      );
  }

  Icon getPriorityIcon(int prior) {
    switch(prior) {
      case 1: return Icon(Icons.play_arrow);
      break;
      case 2 : return Icon(Icons.keyboard_arrow_right);
      break;
      case 3 : return Icon(Icons.keyboard_arrow_up);
      break;
      default: return Icon(Icons.keyboard_double_arrow_right_rounded);
    }
  }
  Color getPriorityColor(int prior) {
    switch(prior) {
      case 1: return Colors.purpleAccent;
      break;
      case 2 : return Colors.yellow;
      break;
      case 3 : return Colors.green;
      break;
      default: return Colors.green;
    }

  }

  void _delete(BuildContext context, Todo todo) async{
     int result = await databaseHelper.deleteTodoList(todo.id);

     if(result != 0) {
       _showSnackBar(context, 'Delete Todo Successd');

       updateListView();
     }
     }
     void  _showSnackBar(BuildContext context, String message) {
     final snackbar = SnackBar(content: Text(message),);

     Scaffold.of(context).showSnackBar(snackbar);
     }

     void navigateTodoDetail(Todo todo,  String title) async { // change to page
        bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return todoDetail();
        }));

        if(result) {
          updateListView();
        }
     }

     void updateListView() {
      final Future<Database> dbFuture = databaseHelper.initDatabase();
    dbFuture.then((db) {
        Future<List<Todo>> todoListFuture = databaseHelper.getTodoList();
        todoListFuture.then((todoList) {
          setState(() {
            this.todoList = todoList;
            this.count = todoList.length;
          });

        });
    });
     }
  }
