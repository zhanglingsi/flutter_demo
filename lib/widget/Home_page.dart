import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/widget/drawer_page.dart';
import 'package:flutter_demo/widget/tab_girl_page.dart';
import 'package:flutter_demo/widget/tab_android_page.dart';
import 'package:flutter_demo/widget/tab_iOS_page.dart';
import 'package:flutter_demo/widget/tab_demo_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  final _key = new GlobalKey<ScaffoldState>();
  var _body;
  var _curIndex = 0;
  
  void _initPage(){
    _body = new IndexedStack(
      children: <Widget>[
        new TabGirlPage(),
        new TabAndroidPage(),
        new TabiOSPage(),
        new TabDemoPage(),
      ],
      index: _curIndex,
    );
  }

  List<BottomNavigationBarItem> _getNavBarItems(){
    return [
      new BottomNavigationBarItem(icon: new Icon(Icons.home), title: new Text("主页")),
      new BottomNavigationBarItem(icon: new Icon(Icons.phone_android), title: new Text("安卓")),
      new BottomNavigationBarItem(icon: new Icon(Icons.phone_iphone), title: new Text("苹果")),
      new BottomNavigationBarItem(icon: new Icon(Icons.dehaze), title: new Text("我的")),
    ];
  }


  void _showDialog() {
    showDialog<Null>(
      context: context,
      child: new AlertDialog(content: new Text('退出app'), actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
              SystemNavigator.pop();
            },
            child: new Text('确定'))
      ]),
    );
  }

  Future<bool> _requestPop() {
    _showDialog();
    return new Future.value(false);
  }

  @override
  Widget build(BuildContext context){
    _initPage();
    return new WillPopScope(
      child: new Scaffold(
        key: _key,
        appBar: new AppBar(
          title: new Text('Flutter学习'),
          centerTitle: true,
        ),
        drawer: new Drawer(
          child: new DrawerPage(),
        ),
        bottomNavigationBar: new BottomNavigationBar(
          items: _getNavBarItems(),
          currentIndex: _curIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              _curIndex=index;
            });
          },
        ),
        body: _body,
      ),
      onWillPop: _requestPop,
    );
    
  }
  
}
