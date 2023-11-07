import 'package:flutter/material.dart';

class SeparatedColumn extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final TextBaseline? textBaseline;
  final List<Widget> children;
  final double spacing;
  final Widget? separator;
  final bool headingSeparator;
  final bool trailingSeparator;

  const SeparatedColumn({
    Key? key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.spacing = 0.0,
    this.children = const <Widget>[],
    this.separator,
    this.headingSeparator = false,
    this.trailingSeparator = false,
  }) : super(key: key);

  Widget _getChild(int i) => Padding(
        padding: EdgeInsets.only(
          top: spacing,
          bottom: i == children.length - 1 ? 0.0 : spacing,
        ),
        child: children[i],
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textBaseline: textBaseline,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      children: [
        if (separator != null && headingSeparator)
          Padding(
            padding: EdgeInsets.only(bottom: spacing),
            child: separator,
          ),
        for (var i = 0; i < children.length; i++)
          if (separator != null && i < children.length - 1)
            Column(
              mainAxisAlignment: mainAxisAlignment,
              mainAxisSize: mainAxisSize,
              crossAxisAlignment: crossAxisAlignment,
              textBaseline: textBaseline,
              textDirection: textDirection,
              verticalDirection: verticalDirection,
              children: [
                _getChild(i),
                Padding(
                  padding: EdgeInsets.only(bottom: spacing),
                  child: separator,
                ),
              ],
            )
          else
            _getChild(i),
        if (separator != null && trailingSeparator)
          Padding(
            padding: EdgeInsets.only(bottom: spacing),
            child: separator,
          ),
      ],
    );
  }
}
