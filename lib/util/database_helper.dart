//requires package module neccessary
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:appflut/models/todo.dart';

class DatabaseHelper{
  static  DatabaseHelper _databaseHelper;
  static Database _database;
  // cols  of Database
  String todoTable = 'TODOLIST';
  String colId = 'id';
  String colTitle = 'title';
  String colDes = 'Descript';
  String colPrior = 'Priority';
  String colDate = 'Date';

  // ignore: unused_element
  DatabaseHelper._createInstance();

  //check Database is null  of CREATE CONTENT TO DATABASE
  factory  DatabaseHelper() {
    if(_databaseHelper == null ) {
      _databaseHelper =DatabaseHelper._createInstance();

    }
    return  _databaseHelper;
    }
    // if not database with return initDatabase
    Future<Database> get database async {
      if(_database == null) {
        _database = await initDatabase();

      }
      return _database;
      }
      //get path of database
      Future<Database> initDatabase() async{
        Directory directory = await getApplicationDocumentsDirectory();
        String path  = directory.path + 'todos.db';

        var todoDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
        return todoDatabase;
      }
      //create DATABASE 1 more of CREATE
      void _createDb(Database db, int newVer) async {
    await db.execute('CREATE TABLE $todoTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDes TEXT, $colPrior INTEGER, $colDate TEXT )');
      }
     Future<List<Map<String, dynamic>>> getTodoMapList() async {
       Database db =await this.database;
       return  await db.query(todoTable, orderBy: '$colPrior');
     }

     Future<int> insertTodoList(Todo todo)  async {
       Database db =await this.database;
       return await db.insert(todoTable, todo.toMap());
     }

     Future<int> updateTodoList(Todo todo) async {
      Database db = await this.database;
      return await db.update(todoTable, todo.toMap(), where: '$colId = ?', whereArgs: [todo.id]);
     }

     Future<int> deleteTodoList(int id) async {
    Database db = await this.database;
    return await db.rawDelete("DELETE FROM $todoTable WHERE $colId = $id");
     }

     Future<int?> getCount() async {
    Database db = await this.database;

    List<Map<String, dynamic>> count = await db.rawQuery('SELECT COUNT(*) FROM $todoTable');
    return Sqflite.firstIntValue(count);

     }

     Future<List<Todo>> getTodoList() async {
      var todoMapList = await getTodoMapList();
      int count = todoMapList.length;
      List<Todo> todoList = List<Todo>();

      for(int i = 0; i< count ; i++) {
        todoList.add(Todo.fromMapObject(todoMapList[i]));
      }
      return todoList;
     }
    }
