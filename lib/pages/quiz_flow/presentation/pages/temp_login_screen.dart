import 'package:empathyapp/app/theme/colors.dart';
import 'package:flutter/material.dart';

class LoinPage extends StatelessWidget {
  const LoinPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EmpathyColors.mainBackroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 151),
        child: Column(
          children: [
            Center(
              child: Text('welocme text'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * (1 / 12),
                vertical: 56,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Full name'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Confirm Password'),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (bool? value) {},
                      ),
                      Text('I agree with the terms & conditions.')
                    ],
                  ),
                  OutlinedButton(
                    onPressed: () => {},
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
