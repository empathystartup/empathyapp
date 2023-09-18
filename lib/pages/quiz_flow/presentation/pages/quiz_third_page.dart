import 'package:empathyapp/app/theme/colors.dart';
import 'package:flutter/material.dart';

class QuizThirdPage extends StatelessWidget {
  const QuizThirdPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: EmpathyColors.mainBackroundColor,
      body: Center(
        child: Text('Terza pagina'),
      ),
    );
  }
}
