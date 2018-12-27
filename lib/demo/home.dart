import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'tab/page1.dart';
import 'tab/page2.dart';
import 'tab/page3.dart';
import 'tab/page4.dart';
import 'drawer.dart';

class DemoHomePage extends StatefulWidget {
  _DemoHomePageState createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage>
    with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> _scaffoldkey =
      GlobalKey<ScaffoldState>();
  var _body;
  var _curIndex = 0;

  void _initPage() {
    _body = new IndexedStack(
      children: <Widget>[
        new TabPage1(),
        new TabPage2(),
        new TabPage3(),
        new TabPage4(),
      ],
      index: _curIndex,
    );
  }

  List<BottomNavigationBarItem> _getNavBarItems() {
    return [
      new BottomNavigationBarItem(
          icon: new Icon(Icons.home), title: new Text("Page1")),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.phone_android), title: new Text("Page2")),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.phone_iphone), title: new Text("Page3")),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.dehaze), title: new Text("Page4")),
    ];
  }

  // 当退出应用的时候，弹出对话框
  void _showDialog() {
    showDialog<Null>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(content: Text('退出app'), actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                SystemNavigator.pop();
              },
              child: Text('确定'),
            )
          ]);
        });
  }

  Future<bool> _requestPop() {
    _showDialog();
    return new Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    _initPage();
    return WillPopScope(
      onWillPop: _requestPop,
      child: new Scaffold(
        key: _scaffoldkey,
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
          onTap: (index) {
            setState(() {
              _curIndex = index;
            });
          },
        ),
        body: _body,
      ),
    );
  }
}
