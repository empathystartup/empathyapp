import 'package:flutter_bloc/flutter_bloc.dart';

class NavigationAction {
  final void Function() onForward;
  final void Function() onBack;

  NavigationAction({required this.onForward, required this.onBack});
}

class QuizFlowNavigationCubit
    extends Cubit<Map<Type, QuizFlowNavigationCubitMixin>> {
  QuizFlowNavigationCubit() : super({});

  void updateCallbacks(
      Type quizFlowState, QuizFlowNavigationCubitMixin action) {
    final newMap = Map<Type, QuizFlowNavigationCubitMixin>.from(state);
    newMap.addAll({quizFlowState: action});
  }

  void removeCallback(Type quizFlowState) {
    final newMap = Map<Type, QuizFlowNavigationCubitMixin>.from(state);
    newMap.removeWhere((key, _) => key == quizFlowState);
  }
}

mixin QuizFlowNavigationCubitMixin {
  void onForward();
  void onBack();
}
