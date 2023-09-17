import 'package:empathyapp/pages/splash/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:route_handler/route_handler.dart';

class SplashScreenRouteHandler extends RouteHandler {
  SplashScreenRouteHandler(RouteSettings settings) : super(settings);

  @override
  Route getRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => const SplashScreen(),
    );
  }
}
