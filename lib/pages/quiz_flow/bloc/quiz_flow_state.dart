import 'package:empathyapp/common/bloc/bloc_states.dart';
import 'package:empathyapp/pages/quiz_flow/model/quiz_model.dart';
import 'package:equatable/equatable.dart';

abstract class QuizFlowState extends Equatable {
  const QuizFlowState();

  @override
  List<Object> get props => [];
}

class QuizCompleted extends PageState implements QuizFlowState {
  final QuizVM quizModel;
  QuizCompleted({required this.quizModel});
}

class QuizFlowInitialState extends PageState implements QuizFlowState {}

class QuizFirstSetPageState extends QuizFlowInitialState {}

class QuizSecondSetPageState extends QuizFirstSetPageState {}

class QuizThirdSetPageState extends QuizSecondSetPageState {}

class QuizFourthSetPageState extends QuizThirdSetPageState {}
