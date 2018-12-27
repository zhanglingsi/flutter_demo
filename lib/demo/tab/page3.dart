import 'package:flutter/material.dart';


class TabPage3 extends StatefulWidget {
  _TabPage3State createState() => _TabPage3State();
}

class _TabPage3State extends State<TabPage3> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: new Text('Page3', style: TextStyle(fontSize: 48.0,color: Colors.lightGreen),),
       color: Colors.deepOrangeAccent,
    );
  }
}