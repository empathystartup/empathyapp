import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationAction {
  final void Function() onForward;
  final void Function() onBack;

  NavigationAction({required this.onForward, required this.onBack});
}

class QuizFlowNavigationCubit
    extends Cubit<Map<Type, QuizFlowNavigationMixin>> {
  QuizFlowNavigationCubit() : super({});

  void updateCallbacks(Type quizFlowState, QuizFlowNavigationMixin action) {
    final newMap = Map<Type, QuizFlowNavigationMixin>.from(state);
    newMap.addAll({quizFlowState: action});
    emit(newMap);
  }

  void removeCallback(Type quizFlowState) {
    final newMap = Map<Type, QuizFlowNavigationMixin>.from(state);
    newMap.removeWhere((key, _) => key == quizFlowState);
    emit(newMap);
  }
}

mixin QuizFlowNavigationMixin {
  void onForward();
  void onBack();
}
