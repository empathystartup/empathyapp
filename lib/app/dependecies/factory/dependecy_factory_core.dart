import 'package:dio/dio.dart';
import 'package:empathyapp/app/app_config.dart';
import 'package:empathyapp/app/dependecies/factory/dependecy_factory.dart';

class DependecyFactoryCore extends DependecyFactory {
  Dio _createDioForApiGateway() {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppConfing.apiBaseUrl,
      ),
    );
    return dio;
  }

  @override
  Dio? createDio(DioType type) {
    if (type == DioType.api) {
      return _createDioForApiGateway();
    }
    return null;
  }

  //TODO: make auth service and bloc
  @override
  void setInterceptors() {
    //TODO: implement function
  }
}
