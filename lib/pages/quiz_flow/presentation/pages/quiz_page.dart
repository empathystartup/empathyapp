import 'package:flutter/material.dart';

abstract class QuizPage extends Page {
  QuizPage(String name) : super(name: name, key: ValueKey(name));

  Widget get child;

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      pageBuilder: (context, animation, secondaryAnimation) {
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
