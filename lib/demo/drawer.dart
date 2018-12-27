import 'package:flutter/material.dart';
import 'package:flutter_demo/common/constant.dart';
import 'package:flutter_demo/data/demos_data.dart';
import 'package:flutter_demo/model/category.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DrawerWeiget(),
    );
  }
}

class DrawerWeiget extends StatefulWidget {
  _DrawerWeigetState createState() => _DrawerWeigetState();
}

class _DrawerWeigetState extends State<DrawerWeiget> {

  final List<Widget> wids = <Widget>[
      new UserAccountsDrawerHeader(
        accountName: const Text(Constant.accountName),
        accountEmail: const Text(Constant.accountEmail),
        currentAccountPicture: new CircleAvatar(
          backgroundImage: const NetworkImage(Constant.headerImageUrl),
        ),
      ),
    ];

  @override
  Widget build(BuildContext context) {
    List<Widget> listTile = kAllDemoCategories.map((DemoCategory category){
      wids.add(new ListTile(
        leading: new Icon(category.icon),
        title: new Text(category.name),
        trailing: new Icon(Icons.keyboard_arrow_right),
        onTap: (){
          Navigator.of(context).pop();
          Navigator.pushNamed(context, category.routerName);
        },
      ));
      wids.add(new Divider());
    }).toList();

    return new ListView(
      padding: const EdgeInsets.only(),
      children: wids,
    );

  }
}