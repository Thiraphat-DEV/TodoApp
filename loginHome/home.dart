import 'package:flutter/material.dart';


class Homepage extends StatelessWidget {
  static String tag = "HOME PAGE";
  
  @override
  Widget build(BuildContext context) {
    final card  = Hero(tag: 'hero', child: Padding(
      padding: EdgeInsets.all(18.0),
      child: CircleAvatar(
        radius: 73.0,
        backgroundColor: Colors.transparent,
      ),
    )
    );

    final hello = Padding(
      padding: EdgeInsets.all(20.0),
      child: Text("Thiraphat Chorakhe", style: TextStyle(fontFamily: 'cursive', color: Colors.white, fontSize: 20.0),),
    );

    final paragraph = Padding(padding: EdgeInsets.all(10.0),
    child: Text('MY THIRAPHAT CHORAKHE AGE 20 YEAR OLD AND I LOVE PROGRMMING AND GENERATE MINIPROJECT IN GITHUB ํํTHIRAPHAT-DEV', style: TextStyle(color:Colors.white),
    ),
    );

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.amber,
            Colors.red.shade400
          ])
        ),
        child: Column(
          children: <Widget>[
            card,
            hello,
            paragraph
          ],
        ),
      ),
    );
  }
}
    