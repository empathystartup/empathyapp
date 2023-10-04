import 'package:empathyapp/app/theme/colors.dart';
import 'package:empathyapp/common/ui_kit/text_input.dart';
import 'package:empathyapp/common/widgets/scrollable_form.dart';
import 'package:flutter/material.dart';

import '../../../../common/validators/email_validator.dart';
import '../../../../common/validators/mandatory_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey =
      GlobalKey<ScrollableFormState>(debugLabel: 'registration_email_form');
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final emailController = TextEditingController();
  final nameFocusNode = FocusNode(debugLabel: 'nameFocusNode');
  final emailFocusNode = FocusNode(debugLabel: 'surnameFocusNode');

  @override
  void dispose() {
    nameController.dispose();
    nameFocusNode.dispose();
    emailController.dispose()
    surnameController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EmpathyColors.mainBackroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextInput(
                      label: 'Full name',
                      hint: 'Your full name',
                      controller: nameController,
                      color: Colors.black,
                      focusNode: nameFocusNode,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      textInputAction: TextInputAction.next,
                      validator: MandatoryValidator().validate,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autofillHints: const [AutofillHints.name],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextInput(
                      label: 'Email',
                      hint: 'Your email',
                      controller: surnameController,
                      color: Colors.black,
                      focusNode: emailFocusNode,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      textInputAction: TextInputAction.done,
                      validator: EmailValidator(
                        mandatory: true,
                        acceptLowerCase: true,
                      ).validate,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      autofillHints: const [AutofillHints.familyName],
                    ),
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
