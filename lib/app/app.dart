import 'package:empathyapp/app/dependecies/dependecy_provider.dart';
import 'package:empathyapp/app/dependecies/factory/dependecy_factory.dart';
import 'package:empathyapp/app/routing/empathy_navigator_observer.dart';
import 'package:empathyapp/app/routing/routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();
  final DependecyFactory dependecyFactory;
  static final navigation = EmpathyNavigatorObserver();
  const App({Key? key, required this.dependecyFactory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DependecyProvider(
      dependecyFactory: dependecyFactory,
      child: Builder(builder: (context) {
        return MaterialApp(
          navigatorKey: App.navigatorKey,
          navigatorObservers: [navigation],
          onGenerateRoute: (settings) =>
              Routes.onGenerateRoute(settings, context),
          initialRoute: Routes.splash,
        );
      }),
    );
  }
}
