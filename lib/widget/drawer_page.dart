import 'package:flutter/material.dart';


class DrawerPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new DrawerWeiget(),
    );

  }
}

class DrawerWeiget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _DrawerWeigetState();
}

class _DrawerWeigetState extends State<DrawerWeiget>{

  @override
  Widget build(BuildContext context){
    return new ListView(
      padding: const EdgeInsets.only(),
      children: <Widget>[
        new UserAccountsDrawerHeader(
          accountName: new Text('Ethen'),
          accountEmail: new Text('zhangls@asiainfo.com'),
          currentAccountPicture: new CircleAvatar(
            backgroundImage: new NetworkImage(
                'https://avatars1.githubusercontent.com/u/13826424?s=400&u=eb775f4fe9b8bac3a21dd467735b6078c47e7325&v=4'),
          ),
        ),
        new ListTile(
            title: new Text('lifecycle 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/LifecyclePage');
            }),
        new Divider(),
        new ListTile(
            title: new Text('Route 学习'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/RoutePage');
            }),
      ],
    );

  }
}