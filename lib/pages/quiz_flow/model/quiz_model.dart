class QuizVM {
  List<QuestionVM>? question;
  QuizVM({required this.question});
}

class QuestionVM {
  String? question;
  List<AnswerVM>? answer;
  QuestionVM({required this.question, required this.answer});
}

class AnswerVM {
  String? value;
  AnswerVM({required this.value});
}
