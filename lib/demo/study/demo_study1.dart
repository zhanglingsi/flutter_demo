import 'package:flutter/material.dart';

class DemoStudy1 extends StatefulWidget {
  static const String routeName = '/study1/demoStudy1';

  _DemoStudy1State createState() => _DemoStudy1State();
}

class _DemoStudy1State extends State<DemoStudy1> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: new Text('DemoStudy1'),
    );
  }
}