import 'package:flutter/material.dart';
import 'package:flutter_demo/data/demos_data.dart';
import 'package:flutter_demo/demo/home.dart';
import 'package:flutter_demo/data/category_data.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({Key key}) : super(key: key);

  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {

  //获取所有路由列表
  Map<String, WidgetBuilder> _buildRoutes() {
    Map<String, WidgetBuilder> map1 = Map<String, WidgetBuilder>.fromIterable(
      kAllAppDemos,
      key: (dynamic demo) => '${demo.routeName}',
      value: (dynamic demo) => demo.buildRoute,
    );

    map1.addAll({kClass1.routerName:kClass1.buildRoute});
    map1.addAll({kClass2.routerName:kClass2.buildRoute});
    map1.addAll({kClass3.routerName:kClass3.buildRoute});
    map1.addAll({kClass4.routerName:kClass4.buildRoute});
    
    return map1;
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
