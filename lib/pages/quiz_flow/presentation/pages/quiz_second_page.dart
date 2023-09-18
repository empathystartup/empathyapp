import 'package:empathyapp/app/theme/colors.dart';
import 'package:flutter/material.dart';

class QuizSecondPage extends StatelessWidget {
  const QuizSecondPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: EmpathyColors.mainBackroundColor,
      body: Center(
        child: Text('Seconda pagina'),
      ),
    );
  }
}
