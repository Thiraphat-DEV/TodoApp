
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

void main() async {
  final dataBase = openDatabase(
      join(await getDatabasesPath(), 'flutter_db.db'),
      version: 1,
      onCreate: (db, version) {
        print("CONNECTED TO DATABASE ");
        return db.execute("CREATE TABLE PERSON(id INTEGER PRIMARY KEY, name TEXT, age INTEGER1");
      }
  );
  Future<void> insertPerson(Person person) async{ // insert Data
    final Database db = await dataBase; //connect to database
    await db.insert('PERSON', person.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);


  }

  // selected data
  Future<List<Person>> persons() async{
    final Database db = await dataBase;
    final List<Map<String, dynamic>>  maps = await db.query('PERSON');

    return List.generate(maps.length, (idx) {
      return Person(
          id: maps[idx]['id'],
          name: maps[idx]['name'],
          age: maps[idx]['age']
      );
    }
    );

  }

  Future<void> updatePerson(Person person) async {
    final Database db = await dataBase;
    await db.update('PERSON', person.toMap(), where: 'id = ? AND name = ?', whereArgs: [person.id, person.name]);
  }

  Future<void> deletePerson(int id) async {
    final Database db = await dataBase;
    await db.delete('PERSON', where: 'id = ?', whereArgs: [id]);
  }
  var initialPerson = Person(
    id: 0,
    name: 'Thiraphat',
    age: 19,
  );
  await insertPerson(initialPerson);
  print(await persons());

  initialPerson = Person(
    id: initialPerson.id,
    name: initialPerson.name,
    age: initialPerson.age + 1,

  );

  await updatePerson(initialPerson);
  print(await persons());

  await deletePerson(initialPerson.id);
  print(await persons());
}
class Person {
  final int id ;
  final String name;
  final int age;

  Person({
    this.id, this.name, this.age
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age
    };
  }
  @override
  String toString() {
    return 'person{id:$id, name: $name, age: $age}';
  }
}
/**
    void main() {
    runApp(appLogin());
    }

    class appLogin extends StatelessWidget {
    final routes = <String, WidgetBuilder>{
    Loginpage.tag: (context) => Loginpage(),
    Homepage.tag: (context) => Homepage(),
    };

    @override
    Widget build(BuildContext context) {
    return MaterialApp(
    title: "LOGIN",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
    primarySwatch: Colors.pink,
    fontFamily: 'cursive',

    ),
    home: Loginpage(),
    routes: routes,
    );
    }
    }
 **/