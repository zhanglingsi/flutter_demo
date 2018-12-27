import 'package:flutter/material.dart';
import 'category.dart';

/*
 * 创建数据模型 Demo 
 * 用于存储数据，构造函数中必填项，用 @required 标示，在用assert方法校验非空
 * 需要时  覆写 operator (相当于java中的equals方法) hashCode 和 toString方法
 * 另：Object 类中 runtimeType 运行期类型
 */
class Demo {
  const Demo({
    @required this.title,
    @required this.icon,
    this.subtitle,
    @required this.category,
    @required this.routeName,
    this.documentationUrl,
    @required this.buildRoute,
  }) : assert(title != null),
       assert(icon != null),
       assert(category != null),
       assert(routeName != null),
       assert(buildRoute != null);
  
  final String title; // 标题
  final IconData icon; // 标题图标
  final String subtitle; // 副标题
  final DemoCategory category; // 所属类型（类型名称+类型图标）
  final String routeName; // 路由字符串
  final WidgetBuilder buildRoute; // 路由对应的Widget
  final String documentationUrl; // 对应的文档URL

  @override
  bool operator == (dynamic other) {
    if (identical(this, other))
      return true;
    if (runtimeType != other.runtimeType)
      return false;
    final Demo typedOther = other;
    return typedOther.title == title && typedOther.routeName == routeName;
  }

  @override
  int get hashCode => hashValues(title, routeName);

  @override
  String toString() {
    return '$runtimeType($title $routeName)';
  }
}