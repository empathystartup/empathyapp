import 'package:empathyapp/app/theme/colors.dart';
import 'package:empathyapp/common/bloc/bloc_states.dart';
import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_bloc.dart';
import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_state.dart';
import 'package:empathyapp/pages/quiz_flow/cubit/quiz_flow_cubit.dart';
import 'package:empathyapp/pages/registration/presentation/screen/login_screen.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/quiz_flow_navigation.dart';
import 'pages/guiz_fourth_page.dart';
import 'pages/quiz_first_page.dart';
import 'pages/quiz_second_page.dart';
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
        resizeToAvoidBottomInset: true,
        backgroundColor: EmpathyColors.mainBackroundColor,
        // appBar: AppBar(
        //   centerTitle: true,
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.transparent,
        //   title: Center(child: Text('title')),
        // ),
        body: Builder(
          builder: (context) => Column(
            children: [
              // BlocConsumer<QuizFlowBloc, QuizFlowState>(
              //   listenWhen: (_, current) => current is QuizFlowError,
              //   listener: (context, state) => {
              //     if (state is QuizFlowError)
              //       {
              //         const Text('errore'),
              //       }
              //   },
              //   builder: (context, state) => const Text('prova'),
              //   buildWhen: (previous, current) => current is PageState,
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: _FlowContent(),
                ),
              ),
              _BottomNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavigation extends StatefulWidget {
  @override
  State<_BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<_BottomNavigation> {
  bool isFirstPage = false;
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizFlowBloc, QuizFlowState>(
      buildWhen: (previous, current) => current.runtimeType != QuizFlowError,
      builder: (context, blocState) => BlocBuilder<QuizFlowNavigationCubit,
          Map<Type, QuizFlowNavigationMixin>>(builder: (context, cubitState) {
        isFirstPage =
            blocState.runtimeType == QuizFlowInitialState ? true : false;

        isLastPage =
            blocState.runtimeType == QuizThirdSetPageState ? true : false;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: QuizFlowNavigation(
            isFirstPage: isFirstPage,
            isLastPage: isLastPage,
            onBack: cubitState[blocState.runtimeType]?.onBack,
            onForward: cubitState[blocState.runtimeType]?.onForward,
          ),
        );
      }),
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
    return BlocListener<QuizFlowBloc, QuizFlowState>(
      listener: (context, state) {
        if (state is QuizCompleted) {
          Navigator.of(context, rootNavigator: true).pushReplacement(
            MaterialPageRoute(
              settings: const RouteSettings(name: 'quiz completed'),
              builder: (_) => const LoginPage(),
            ),
          );
        } else {
          flowController.update((_) => state);
        }
      },
      listenWhen: (previous, current) => current is PageState,
      child: FlowBuilder(
        controller: flowController,
        onGeneratePages: (state, _) => [
          if (state is QuizFlowInitialState) QuizFirstPage(),
          if (state is QuizFirstSetPageState) QuizSecondPage(),
          if (state is QuizSecondSetPageState) QuizThirdPage(),
          if (state is QuizThirdSetPageState) QuizFourthPage(),
        ],
      ),
    );
  }
}
