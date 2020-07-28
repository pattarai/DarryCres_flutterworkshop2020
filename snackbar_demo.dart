import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class SnackbarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SnackbarDemo();
  }
}

class _SnackbarDemo extends State<SnackbarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          RaisedButton(
              child: Text("Click for Snackbar"),
              onPressed: (){
                var snackbar =SnackBar(
                  content: Text("It is a snackbar!"),
                );
                Scaffold.of(context).showSnackBar(snackbar);
              }),
          RaisedButton(
            child: Text("Show a toast message"),
            onPressed: (){
              Toast.show("This is a toast message", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
            },)
        ],
      ),
    );
  }
}