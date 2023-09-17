import 'package:flutter/material.dart';

class EmpathyNavigatorObserver extends NavigatorObserver {
  final routeStack = <Route>[];

  bool isInStack(String routeName) {
    final index = routeStack.indexWhere(
      (route) => route.settings.name == routeName,
    );
    return index >= 0;
  }

  String? get topOfStackName =>
      routeStack.isNotEmpty ? routeStack.first.settings.name : null;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.insert(0, route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeAt(0);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    routeStack.removeAt(0);
  }

  @override
  void didReplace({Route<dynamic>? oldRoute, Route<dynamic>? newRoute}) {
    final index = routeStack
        .indexWhere((route) => route.settings.name == oldRoute?.settings.name);
    if (index >= 0) {
      routeStack.removeAt(index);
      routeStack.insert(index, newRoute!);
    }
  }
}
