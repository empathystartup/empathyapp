import 'package:empathyapp/common/bloc/bloc_states.dart';
import 'package:equatable/equatable.dart';

abstract class QuizFlowState extends Equatable {
  const QuizFlowState();

  @override
  List<Object> get props => [];
}

class QuizCompleted extends PageState implements QuizFlowState {
  //final QuizVM quizModel;
  //QuizCompleted({required this.quizModel});
  QuizCompleted();
}

class QuizFlowError extends ErrorState implements QuizFlowState {
  QuizFlowError(String localizedReasonKey) : super(localizedReasonKey);
}

class QuizFlowInitialState extends PageState implements QuizFlowState {}

class QuizFirstSetPageState extends QuizFlowInitialState {}

class QuizSecondSetPageState extends QuizFirstSetPageState {}

class QuizThirdSetPageState extends QuizSecondSetPageState {}

class QuizFourthSetPageState extends QuizThirdSetPageState {}
