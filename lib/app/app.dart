import 'package:flutter/material.dart';

import '../pages/splash_screen.dart';

class App extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}
