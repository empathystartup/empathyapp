import 'package:empathyapp/common/bloc/bloc_states.dart';
import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'quiz_flow_event.dart';

class QuizFlowBloc extends Bloc<QuizFlowEvent, QuizFlowState> {
  QuizFlowBloc() : super(QuizFlowInitialState()) {
    on<SumbitFirstAnswer>(_onFirstAnswerSubmit);
    on<SumbitSecondAnswer>(_onSecondAnswerSubmit);
    on<SumbitThirdAnswer>(_onThirdAnswerSubmit);
    on<OnQuizCompletedEvent>(_onQuizSubmit);
    on<QuizFlowBack>(_goBack);
  }

  PageState? _lastPageState;
  @override
  void onTransition(Transition<QuizFlowEvent, QuizFlowState> transition) {
    final nextState = transition.nextState;
    if (nextState is PageState) {
      _lastPageState = nextState as PageState;
    }
    super.onTransition(transition);
  }

  void _onFirstAnswerSubmit(
      SumbitFirstAnswer event, Emitter<QuizFlowState> emit) async {
    emit(QuizFirstSetPageState());
  }

  void _onSecondAnswerSubmit(
      SumbitSecondAnswer event, Emitter<QuizFlowState> emit) async {
    emit(QuizSecondSetPageState());
  }

  void _onThirdAnswerSubmit(
      SumbitThirdAnswer event, Emitter<QuizFlowState> emit) async {
    emit(QuizThirdSetPageState());
  }

  void _onQuizSubmit(
      OnQuizCompletedEvent event, Emitter<QuizFlowState> emit) async {
    emit(QuizCompleted());
  }

  QuizFlowState _goBack(QuizFlowBack event, Emitter<QuizFlowState> emit) {
    switch (_lastPageState?.runtimeType) {
      case QuizFirstSetPageState:
        emit(QuizFlowInitialState());
      case QuizSecondSetPageState:
        emit(QuizFirstSetPageState());
      case QuizThirdSetPageState:
        emit(QuizSecondSetPageState());
      default:
        return QuizFlowInitialState();
    }
    return QuizFlowInitialState();
  }
}
