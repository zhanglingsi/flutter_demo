import 'package:flutter/material.dart';


class TabPage1 extends StatefulWidget {
  _TabPage1State createState() => _TabPage1State();
}

class _TabPage1State extends State<TabPage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: new Text('Page1'),
       color: Colors.deepPurple,
    );
  }
}