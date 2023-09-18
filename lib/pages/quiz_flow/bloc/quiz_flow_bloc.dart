import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'quiz_flow_event.dart';

class QuizFlowBloc extends Bloc<QuizFlowEvent, QuizFlowState> {
  QuizFlowBloc() : super(QuizFlowInitialState()) {
    on<SumbitFirstAnswer>(_onFirstAnswerSubmit);
    on<SumbitSecondAnswer>(_onSecondAnswerSubmit);
    on<SumbitThirdAnswer>(_onThirdAnswerSubmit);
    on<SumbitFourthAnswer>(_onFourthAnswerSubmit);
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

  void _onFourthAnswerSubmit(
      SumbitFourthAnswer event, Emitter<QuizFlowState> emit) async {
    emit(QuizFourthSetPageState());
  }
}
