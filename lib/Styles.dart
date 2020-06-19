import 'package:flutter/material.dart';

class JessesStyle extends StatelessWidget{
  String text;
  JessesStyle({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.green[400], fontWeight: FontWeight.bold) , );
  }
}