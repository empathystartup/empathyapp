import 'package:empathyapp/app/dependecies/factory/dependecy_factory.dart';
import 'package:empathyapp/pages/quiz_flow/bloc/quiz_flow_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_handler/route_handler.dart';

import '../presentation/quiz_flow.dart';

class QuizFlowRouteHandler extends RouteHandler {
  QuizFlowRouteHandler(RouteSettings settings) : super(settings);

  @override
  Route getRoute(BuildContext context) {
    // return MaterialPageRoute(
    //   settings: settings,
    //   builder: (_) => QuizFlow(),
    // );
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => BlocProvider(
        create: RepositoryProvider.of<CubitCreator<QuizFlowBloc>>(context),
        child: QuizFlow(),
      ),
    );
  }
}
