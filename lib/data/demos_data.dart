import 'package:flutter/material.dart';
import 'package:flutter_demo/model/demo.dart';
import 'package:flutter_demo/common/app_icons.dart';
import 'package:flutter_demo/data/category_data.dart';
import 'package:flutter_demo/model/category.dart';
import 'package:flutter_demo/demo/study/demo_study1.dart';
import 'package:flutter_demo/demo/study/demo_study2.dart';

// 创建列表
List<Demo> _buildMyAppDemos(){
  final List<Demo> myAppDemos = <Demo>[
    Demo(
      title: '列表展示图片',
      subtitle: '布局练习',
      icon: MyAppIcons.backdrop,
      category: kClass1,
      routeName: DemoStudy1.routeName,
      buildRoute: (BuildContext context) => DemoStudy1(),
    ),
  ];

  // 动态添加一个菜单项
  assert(() {
    myAppDemos.insert(1,
      Demo(
        title: 'Pesto',
        subtitle: 'Simple recipe browser',
        icon: Icons.adjust,
        category: kClass2,
        routeName: DemoStudy2.routeName,
        buildRoute: (BuildContext context) => DemoStudy2(),
      ),
    );
    return true;
  }());

  return myAppDemos;
}

final List<Demo> kAllAppDemos = _buildMyAppDemos();

// 分类集合 数据项 去掉重复的类型 使用Set
final Set<DemoCategory> kAllDemoCategories =
  kAllAppDemos.map<DemoCategory>((Demo demo) => demo.category).toSet();

// 分类集合对应的 菜单项 集合
final Map<DemoCategory, List<Demo>> kGalleryCategoryToDemos =
  Map<DemoCategory, List<Demo>>.fromIterable(
    kAllDemoCategories,
    value: (dynamic category) {
      return kAllAppDemos.where((Demo demo) => demo.category == category).toList();
    },
  );

final Map<String, String> kDemoDocumentationUrl =
    Map<String, String>.fromIterable(
      kAllAppDemos.where((Demo demo) => demo.documentationUrl != null),
      key: (dynamic demo) => demo.routeName,
      value: (dynamic demo) => demo.documentationUrl,
    );