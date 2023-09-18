import 'package:empathyapp/app/routing/routes.dart';
import 'package:empathyapp/app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    initAsync();
    super.initState();
  }

  Future<void> initAsync() async {
    await Future.wait(
      [
        waitLoading(),
      ],
    );
    if (!context.mounted) return;
    await Navigator.of(context).pushReplacementNamed(Routes.login);
  }

  Future<void> waitLoading() => Future.delayed(
        const Duration(seconds: 8, milliseconds: 40),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EmpathyColors.mainBackroundColor,
      body: Center(
        child: Lottie.asset('assets/animations/welcome0.json'),
      ),
    );
  }
}
