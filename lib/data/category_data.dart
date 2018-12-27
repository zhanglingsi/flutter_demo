import 'package:flutter_demo/model/category.dart';
import 'package:flutter_demo/common/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/category/study1.dart';
import 'package:flutter_demo/demo/category/study2.dart';
import 'package:flutter_demo/demo/category/study3.dart';
import 'package:flutter_demo/demo/category/study4.dart';

//类别1
DemoCategory kClass1 = DemoCategory(
  name: '学习1',
  icon: MyAppIcons.animation,
  routerName: Study1.routerName,
  buildRoute: (BuildContext context) => Study1(),
);
//类别2
DemoCategory kClass2 = DemoCategory(
  name: '学习2',
  icon: MyAppIcons.custom_typography,
  routerName: Study2.routerName,
  buildRoute: (BuildContext context) => Study2(),
);
//类别3
DemoCategory kClass3 = DemoCategory(
  name: '学习3',
  icon: MyAppIcons.category_mdc,
  routerName: Study3.routerName,
  buildRoute: (BuildContext context) => Study3(),
);
//类别4
DemoCategory kClass4 = DemoCategory(
  name: '学习4',
  icon: MyAppIcons.phone_iphone,
  routerName: Study4.routerName,
  buildRoute: (BuildContext context) => Study4(),
);