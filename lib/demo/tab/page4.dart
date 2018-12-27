import 'package:flutter/material.dart';


class TabPage4 extends StatefulWidget {
  _TabPage4State createState() => _TabPage4State();
}

class _TabPage4State extends State<TabPage4> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: new Text('Page4', style: TextStyle(fontSize: 38.0,color: Colors.purpleAccent),),
       color: Colors.greenAccent,
    );
  }
}