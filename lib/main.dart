import 'package:catcher/catcher.dart';
import 'package:empathyapp/app/app.dart';
import 'package:empathyapp/app/dependecies/factory/dependecy_factory.dart';
import 'package:empathyapp/components/device_info_checker.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final customCathcerLogParameters = await makeCathcerCustomParameters();

  final catcherDebugOptions = CatcherOptions(
    DialogReportMode(),
    [ConsoleHandler()],
    customParameters: customCathcerLogParameters,
  );

  final dependecyFactory = DependecyFactory.fromEnviorment();

  Catcher(
    rootWidget: App(
      dependecyFactory: dependecyFactory,
    ),
    debugConfig: catcherDebugOptions,
    ensureInitialized: true,
  );
}

Future<Map<String, dynamic>> makeCathcerCustomParameters() async {
  final deviceInfo = DeviceInfoChecker();
  final systemDescriotions = deviceInfo.getSystemDescriotion();

  return {'system': systemDescriotions};
}
