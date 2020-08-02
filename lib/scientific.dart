import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'drawer.dart';


class scientific extends StatefulWidget {
  @override
  _scientificState createState() => _scientificState();
}

class _scientificState extends State<scientific> {

  String eqn = "0";
  String result = "0";
  String exp = "";
  double eqnFontSize = 35.0;
  double resultFontSize = 45.0;

  buttonpressed(String buttontext) {

    setState(() {
      if (buttontext == "C"){
        eqn = "0";
        result = "0";
        double eqnFontSize = 35.0;
        double resultFontSize = 45.0;
      }
      else if (buttontext == "back") {
        double eqnFontSize = 35.0;
        double resultFontSize = 45.0;
        eqn = eqn.substring(0, eqn.length - 1);
        if(eqn == ""){
          eqn = "0";
        }
      }
      else if (buttontext == "=") {
        double eqnFontSize = 35.0;
        double resultFontSize = 45.0;
        exp = eqn;
        exp = exp.replaceAll('x', '*');
        exp = exp.replaceAll('/', '/');
        exp = exp.replaceAll('POWER_SIGN', '^');
        exp = exp.replaceAll('ARCSIN_SIGN', 'sin');
        exp = exp.replaceAll('ARCCOS_SIGN', 'cos');
        exp = exp.replaceAll('ARCTAN_SIGN', 'tan');
        exp = exp.replaceAll('3.1415', 'pi');
        exp = exp.replaceAll('LG_SIGN', 'log');
        exp = exp.replaceAll('SQUARE_ROOT_SIGN', 'sqrt');
        exp = exp.replaceAll('MODULAR_SIGN', 'mod');


        try{
          Parser p =new Parser();
          Expression ex = p.parse(exp);
          ContextModel cm = ContextModel();
          result = '${ex.evaluate(EvaluationType.REAL, cm)}';
        }catch(e){
          result = "Error";
        }

      }
      else {
        double eqnFontSize = 45.0;
        double resultFontSize = 35.0;
        if(eqn == "0") {
          eqn = buttontext;
        }
        else {
          eqn = eqn + buttontext ;
        }
      }

    });

  }

  Widget buildbutton (String buttontext , double buttonheight, Color buttoncolor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonheight,
      color: buttoncolor,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
          side: BorderSide(color: Colors.white, width: 1, style: BorderStyle.solid),
        ),
        padding: EdgeInsets.all(9.0),
        onPressed: () => buttonpressed(buttontext),
        child: Text(
          buttontext,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text(eqn, style: TextStyle(fontSize: eqnFontSize),),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text(result, style: TextStyle(fontSize: resultFontSize),),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.1 * 7,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        buildbutton("AC", 1, Colors.black),
                        buildbutton("<-", 1, Colors.black),
                        buildbutton("x", 1, Colors.black),
                        buildbutton("/", 1, Colors.black),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("SqRt", 1, Colors.blueGrey),
                        buildbutton("mod", 1, Colors.blueGrey),
                        buildbutton("log", 1, Colors.blueGrey),
                        buildbutton("^", 1, Colors.black),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("sin", 1, Colors.blueGrey),
                        buildbutton("cos", 1, Colors.blueGrey),
                        buildbutton("tan", 1, Colors.blueGrey),
                        buildbutton("pi", 1, Colors.black),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("1", 1, Colors.cyan),
                        buildbutton("2", 1, Colors.cyan),
                        buildbutton("3", 1, Colors.cyan),
                        buildbutton("-", 1, Colors.black),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("4", 1, Colors.cyan),
                        buildbutton("5", 1, Colors.cyan),
                        buildbutton("6", 1, Colors.cyan),
                        buildbutton("+", 1, Colors.black),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton("7", 1, Colors.cyan),
                        buildbutton("8", 1, Colors.cyan),
                        buildbutton("9", 1, Colors.cyan),
                        buildbutton("=", 1, Colors.black),
                      ],
                    ),
                    TableRow(
                      children: [
                        buildbutton(".", 1, Colors.cyan),
                        buildbutton("0", 1, Colors.cyan),
                        buildbutton("00", 1, Colors.cyan),
                        buildbutton("01", 1, Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
