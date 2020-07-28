import 'package:flutter/material.dart';

    class LoginPage extends StatefulWidget{
    @override
    State<StatefulWidget> createState() {
    return _LoginPage();
    }
    }

    class _LoginPage extends State<LoginPage>{
    @override
    Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    centerTitle: true,
    title: Text("Login"),
    ),
    body: Column(
    children: <Widget>[
    Text("UserID"),
    TextFormField(

    ),
    Text("Pin"),
    TextFormField(

    ),
    RaisedButton(
    child: Text("Sign In"),
    onPressed: null,
    ),
    RaisedButton(
    child: Text("Sign Up"),
    ),
    ],
    ),
    );
    }
    }