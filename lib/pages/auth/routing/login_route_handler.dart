import 'package:flutter/material.dart';
import 'package:route_handler/route_handler.dart';

import '../presentation/login_screen.dart';

class LoginScreenRouteHandler extends RouteHandler {
  LoginScreenRouteHandler(RouteSettings settings) : super(settings);

  @override
  Route getRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const MyApp(),
    );
  }
}
