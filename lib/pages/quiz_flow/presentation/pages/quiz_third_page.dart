import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_bloc.dart';
import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_event.dart';
import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_state.dart';
import 'package:empathyapp/pages/quiz_flow/model/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/quiz_flow_cubit.dart';
import 'quiz_page.dart';

class QuizThirdPage extends QuizPage {
  QuizThirdPage() : super('terza page');

  @override
  Widget get child => _FirstPage();
}

class _FirstPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => __FirstPageState();
}

class __FirstPageState extends State<_FirstPage> with QuizFlowNavigationMixin {
  @override
  void initState() {
    BlocProvider.of<QuizFlowNavigationCubit>(context)
        .updateCallbacks(QuizSecondSetPageState, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('terza pagina'),
    );
  }

  @override
  void onBack() {
    BlocProvider.of<QuizFlowBloc>(context).add(QuizFlowBack());
  }

  @override
  void onForward() {
    BlocProvider.of<QuizFlowBloc>(context).add(
      SumbitThirdAnswer(
        answerValue: AnswerVM(value: 'Risposte batch 3'),
      ),
    );
  }
}
