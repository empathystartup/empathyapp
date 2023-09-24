import 'package:empathyapp/app/dependecies/factory/dependecy_factory.dart';
import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DependecyProvider extends StatelessWidget {
  final Widget child;
  final DependecyFactory dependecyFactory;

  const DependecyProvider({
    Key? key,
    required this.child,
    required this.dependecyFactory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<DioForApi?>.value(value: dependecyFactory.dioForApi),
        RepositoryProvider<CubitCreator<QuizFlowBloc>>.value(
          value: dependecyFactory.createQuizFlowBloc,
        )
      ],
      child: child,
    );
  }
}
