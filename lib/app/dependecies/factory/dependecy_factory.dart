import 'package:empathyapp/app/dependecies/factory/dependecy_factory_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_services/http_services.dart';

typedef CubitCreator<T extends Cubit> = T Function(BuildContext context);

typedef ServiceCreator<T extends HttpServiceBase> = T Function(
    BuildContext context);

typedef DioCreator = Dio Function(DioType type);

enum DioType { api }

class DioForApi {
  final Dio? dio;

  DioForApi(this.dio);
}

abstract class DependecyFactory {
  DioForApi? _dioForApi;

  DioForApi? get dioForApi => _dioForApi;

  DependecyFactory() {
    _dioForApi = DioForApi(createDio(DioType.api));
    setInterceptors();
  }

  static DependecyFactory fromEnviorment({DependecyFactory? defaultFacotry}) {
    return defaultFacotry ?? DependecyFactoryCore();
  }

  @protected
  Dio? createDio(DioType type);

  @protected
  void setInterceptors();
}
