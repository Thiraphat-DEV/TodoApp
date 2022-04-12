import 'package:flutter/material.dart';
import 'home.dart';

class Loginpage extends StatefulWidget {
  // setState
  static String tag = 'LOGIN';
  @override
  _LoginpageState createState() =>  new _LoginpageState();
  
}

class _LoginpageState extends State {
  @override
  Widget build(BuildContext context) {
    final LOGO = Hero(tag: 'hero', child:CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 50.0,
      child: Image.asset('images/photo.jpg'),
    )
    );
    
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
    autofocus: true,
    initialValue: '',
    decoration: InputDecoration(
      hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0 ,20.0 ,20.0),
      border: OutlineInputBorder(borderRadius:BorderRadius.circular(34.0)),
    ),  
    );
    
    final password = TextFormField(
      autofocus: false,
      initialValue: '',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 20.0 ,20.0 ,20.0),
        border: OutlineInputBorder(borderRadius:BorderRadius.circular(34.0)), 
      ),
    );
    
    final btnLogin = Padding(padding: EdgeInsets.symmetric(vertical: 18.0), child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(Homepage.tag);
      },
      padding: EdgeInsets.all(12),
      color: Colors.green,
      child: Text('LOGIN', style: TextStyle(color: Colors.amber),),
    ),
    );

    final forgotPassword = FlatButton(
        onPressed: () {},
        child:Text("Forgot Password", style: TextStyle(color: Colors.black),
        )
    );
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Center(
        child: ListView(
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          shrinkWrap: true,
          children: <Widget>[
            LOGO,
            SizedBox(height: 50.0),
            email,
            SizedBox(height: 10.0),
            password,
            SizedBox(height: 30.0),
            btnLogin,
            SizedBox(height: 12.0),
            forgotPassword
          ],
        ),
      ),
    );

  }
}

