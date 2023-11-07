import 'package:flutter/widgets.dart';

import '../../../../app/theme/colors.dart';

class RegisterTitleWidget extends StatelessWidget {
  const RegisterTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        bottom: 40,
      ),
      child: Text.rich(
        TextSpan(
          style: TextStyle(
            fontSize: 24,
            color: EmpathyColors.empathyMainAccent,
            fontWeight: FontWeight.w400,
            fontFamily: 'OggRegular',
            height: 30 / 24,
          ),
          children: [
            TextSpan(
              text: 'We’re glad your here.\n',
            ),
            TextSpan(text: 'Let’s start.'),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
