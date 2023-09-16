import 'dart:core';

class AppConfing {
  static const apiBaseUrl =
      String.fromEnvironment('API_BASE_URL', defaultValue: '');
}
