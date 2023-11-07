import 'package:flutter/material.dart';

class QuizFlowNavigation extends StatelessWidget {
  final void Function()? onBack;
  final void Function()? onForward;
  final bool isFirstPage;
  final bool isLastPage;

  const QuizFlowNavigation({
    Key? key,
    required this.onBack,
    required this.onForward,
    this.isFirstPage = false,
    this.isLastPage = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(
        mainAxisAlignment: isFirstPage
            ? MainAxisAlignment.end
            : MainAxisAlignment.spaceBetween,
        children: [
          if (isFirstPage != true)
            _QuizFlowNavigationArrow(
              direction: _NavigationDirection.back,
              onPressed: onBack,
            ),
          if (isLastPage)
            _QuizSubmitButton(
              onPressed: onForward,
            )
          else
            _QuizFlowNavigationArrow(
              direction: _NavigationDirection.forward,
              onPressed: onForward,
            )
        ],
      ),
    );
  }
}

class _QuizSubmitButton extends StatelessWidget {
  final void Function()? onPressed;
  const _QuizSubmitButton({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onPressed == null) {
      return const SizedBox.shrink();
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(const RoundedRectangleBorder()),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1.5 / 12,
        child: const AspectRatio(
          aspectRatio: 1,
          child: Center(
            child: Text(
              'submit',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}

class _QuizFlowNavigationArrow extends StatelessWidget {
  final _NavigationDirection? direction;
  final void Function()? onPressed;

  const _QuizFlowNavigationArrow({Key? key, this.direction, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (onPressed == null) {
      return const SizedBox.shrink();
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shape: MaterialStateProperty.all(const CircleBorder()),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1.5 / 12,
        child: AspectRatio(
          aspectRatio: 1,
          child: Center(
            child: Icon(
              direction?.icon,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

enum _NavigationDirection { forward, back }

extension _NavigationDirectionExtension on _NavigationDirection {
  IconData? get icon {
    switch (this) {
      case _NavigationDirection.forward:
        return Icons.arrow_forward;
      case _NavigationDirection.back:
        return Icons.arrow_back;
      default:
        return null;
    }
  }
}
