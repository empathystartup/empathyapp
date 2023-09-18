import 'package:empathyapp/app/theme/colors.dart';
import 'package:empathyapp/common/bloc/bloc_states.dart';
import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_bloc.dart';
import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_state.dart';
import 'package:empathyapp/pages/quiz_flow/cubit/quiz_flow_cubit.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/quiz_third_page.dart';

class QuizFlow extends StatelessWidget {
  final int _totalPages = 4;
  // int? _getFromState(QuizFlowState state) {
  //   switch (state.runtimeType) {
  //     case FirstQuizPage:
  //       return 1;
  //     case SecondQuizPage:
  //       return 2;
  //     case ThirdQuizPage:
  //       return 3;
  //     case FourthQuizPage:
  //       return 4;
  //     default:
  //       return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuizFlowNavigationCubit>(
      create: (context) => QuizFlowNavigationCubit(),
      child: Scaffold(
        backgroundColor: EmpathyColors.mainBackroundColor,
        body: Builder(
          builder: (context) => Column(
            children: [
              Expanded(
                child: _FlowContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FlowContent extends StatefulWidget {
  @override
  State<_FlowContent> createState() => _FlowContentState();
}

class _FlowContentState extends State<_FlowContent> {
  final flowController = FlowController<QuizFlowState>(QuizFlowInitialState());

  @override
  void dispose() {
    flowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FlowBuilder(
      onGeneratePages: (state, _) => [
        if (state is QuizFlowInitialState) QuizThirdPage(),
      ],
    );
  }
}
