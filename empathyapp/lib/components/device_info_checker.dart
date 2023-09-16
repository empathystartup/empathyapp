import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoChecker {
  bool get isAndroid => Platform.isAndroid;
  bool get isIOS => Platform.isIOS;

  Future<String> getSystemDescriotion() async {
    final info = DeviceInfoPlugin();
    if (isAndroid) {
      final androidInfo = await info.androidInfo;
      final release = androidInfo.version.release;
      final sdkInt = androidInfo.version.sdkInt;
      final manufacturer = androidInfo.manufacturer;
      final model = androidInfo.model;

      return 'Android $release (SDK $sdkInt), $manufacturer, $model';
    }

    if (isIOS) {
      final iosInfo = await info.iosInfo;
      final systeName = iosInfo.systemName;
      final version = iosInfo.systemVersion;
      final name = iosInfo.name;
      final model = iosInfo.model;

      return 'IOS $systeName, $version, $name, $model';
    }
    return 'Unknown Device';
  }
}
