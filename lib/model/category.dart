import 'package:flutter/material.dart';

/*
 * 创建数据模型 DemoCategory 
 * 用于存储数据，构造函数中必填项，用 @required 标示，在用assert方法校验非空
 * 需要时  覆写 operator (相当于java中的equals方法) hashCode 和 toString方法
 * 另：Object 类中 runtimeType 运行期类型
 */
class DemoCategory {
  const DemoCategory({
      @required this.name,
      @required this.icon,
      @required this.routerName,
      @required this.buildRoute})
      : assert(name != null),
        assert(icon != null),
        assert(buildRoute != null),
        assert(routerName != null);
  @required
  final String name; // 类型名称
  @required
  final IconData icon; // 类型对应的图标
  @required
  final String routerName; // 路由名称
  @required
  final WidgetBuilder buildRoute; // 路由对应的Widget

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;
    final DemoCategory typedOther = other;
    return typedOther.name == name &&
        typedOther.icon == icon &&
        typedOther.routerName == routerName;
  }

  @override
  int get hashCode => hashValues(name, icon, routerName);

  @override
  String toString() {
    return '$runtimeType($name,$routerName)';
  }
}
