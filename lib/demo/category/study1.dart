import 'package:flutter/material.dart';

class Study1 extends StatefulWidget {
  static const routerName ='/study1';
  _Study1State createState() => _Study1State();
}

class _Study1State extends State<Study1> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: new Text('study1'),
    );
  }
}