import 'package:flutter/material.dart';


class TabPage2 extends StatefulWidget {
  _TabPage2State createState() => _TabPage2State();
}

class _TabPage2State extends State<TabPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: new Text('Page2', style: TextStyle(fontSize: 28.0,color: Colors.indigoAccent),),
       color: Colors.deepPurple,
    );
  }
}