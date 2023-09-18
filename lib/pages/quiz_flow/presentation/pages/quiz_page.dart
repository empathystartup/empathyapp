import 'package:flutter/material.dart';

abstract class RegistrationPage extends Page {
  RegistrationPage(String name)
      : super(name: name, key: name != null ? ValueKey(name) : null);

  Widget get child;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) {
        // return child;
        final tween = Tween<Offset>(
          begin: const Offset(1, 0),
          end: const Offset(0, 0),
        );
        final secondaryTween = Tween<Offset>(
          begin: const Offset(0, 0),
          end: const Offset(-1, 0),
        );
        return SlideTransition(
          position: animation.drive(tween),
          child: SlideTransition(
            position: secondaryAnimation.drive(secondaryTween),
            child: child,
          ),
        );
      },
    );
  }
}
