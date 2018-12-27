import 'package:flutter/material.dart';
import 'package:flutter_demo/data/demos_data.dart';
import 'package:flutter_demo/demo/home.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({Key key}) : super(key: key);

  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {

  //获取所有路由列表
  Map<String, WidgetBuilder> _buildRoutes() {
    return Map<String, WidgetBuilder>.fromIterable(
      kAllAppDemos,
      key: (dynamic demo) => '${demo.routeName}',
      value: (dynamic demo) => demo.buildRoute,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter Study Demo',
      color: Colors.deepOrangeAccent,
      routes: _buildRoutes(),
      home: DemoHomePage(),
    );
  }
}
