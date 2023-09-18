import 'package:equatable/equatable.dart';

import '../model/quiz_model.dart';

abstract class QuizFlowEvent extends Equatable {
  const QuizFlowEvent();
  @override
  List<Object> get props => [];
}

class SumbitFirstAnswer extends QuizFlowEvent {
  final AnswerVM? answerValue;
  const SumbitFirstAnswer({required this.answerValue});
}

class SumbitSecondAnswer extends QuizFlowEvent {
  final AnswerVM? answerValue;
  const SumbitSecondAnswer({required this.answerValue});
}

class SumbitThirdAnswer extends QuizFlowEvent {
  final AnswerVM? answerValue;
  const SumbitThirdAnswer({required this.answerValue});
}

class SumbitFourthAnswer extends QuizFlowEvent {
  final AnswerVM? answerValue;
  const SumbitFourthAnswer({required this.answerValue});
}
