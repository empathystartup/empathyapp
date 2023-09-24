import 'package:empathyapp/app/theme/colors.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EmpathyColors.mainBackroundColor,
      appBar: AppBar(
        title: Center(child: Text('ciao')),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Eccofdsfsdf dmi'),
              Text('Eccofdsfsdf dmi'),
              Text('Eccofdsfsdf dmi'),
              Text('Eccofdsfsdf dmi'),
              Text('Eccofdsfsdf dmi'),
            ],
          ),
        ),
      ),
    );
  }
}
