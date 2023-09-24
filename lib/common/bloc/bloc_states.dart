import 'dart:math';

import 'package:equatable/equatable.dart';

abstract class LoadingState extends Equatable {
  @override
  List<Object> get props => [runtimeType];
}

abstract class ErrorState extends Equatable {
  final id = Random().nextInt(4294967296); //2^32
  final String localizedReasonKey;

  ErrorState(this.localizedReasonKey);

  @override
  List<Object> get props => [localizedReasonKey, id];
}

abstract class DataLoadedState<T> extends Equatable {
  final T data;

  @override
  List<T> get props => [data];

  const DataLoadedState(this.data);
}

abstract class PageState extends Equatable {
  @override
  List<Object> get props => [runtimeType];
}

abstract class ValidationState extends Equatable {
  final String errorMessage;

  const ValidationState(this.errorMessage);
  bool get isValid => errorMessage?.trim()?.isNotEmpty ?? false;

  @override
  List<Object> get props => [runtimeType];
}
