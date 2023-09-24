import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_bloc.dart';
import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_event.dart';
import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/quiz_flow_cubit.dart';
import 'quiz_page.dart';

class QuizFourthPage extends QuizPage {
  QuizFourthPage() : super('quarta page');

  @override
  Widget get child => _FourthPage();
}

class _FourthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => __FirstPageState();
}

class __FirstPageState extends State<_FourthPage> with QuizFlowNavigationMixin {
  @override
  void initState() {
    BlocProvider.of<QuizFlowNavigationCubit>(context)
        .updateCallbacks(QuizThirdSetPageState, this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.5,
            child: const Column(
              children: [
                Text(
                  'Quiz completato con successo, puoi revisioanre le tue risposte precedenti oppure procedi alla Registrazione',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void onBack() {
    BlocProvider.of<QuizFlowBloc>(context).add(QuizFlowBack());
  }

  @override
  void onForward() {
    BlocProvider.of<QuizFlowBloc>(context).add(OnQuizCompletedEvent());
  }
}
