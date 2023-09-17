import 'package:empathyapp/pages/auth/routing/login_route_handler.dart';
import 'package:empathyapp/pages/splash/routing/splash_route_handler.dart';
import 'package:flutter/material.dart';

class Routes {
  static const root = '/';
  static const splash = 'splash';
  static const login = 'login';

  static Route? onGenerateRoute(RouteSettings settings, BuildContext context) {
    final route = settings.name?.split('?').first;

    switch (route) {
      case splash:
        return SplashScreenRouteHandler(settings).getRoute(context);
      case login:
        return LoginScreenRouteHandler(settings).getRoute(context);
      default:
        null;
    }
    return null;
  }
}
