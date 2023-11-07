import 'package:empathyapp/app/theme/colors.dart';
import 'package:empathyapp/common/ui_kit/text_input.dart';
import 'package:empathyapp/common/widgets/scrollable_form.dart';
import 'package:empathyapp/common/widgets/widgets/separated_column.dart';
import 'package:flutter/material.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

import '../../../../common/validators/email_validator.dart';
import '../../../../common/validators/mandatory_validator.dart';
import '../../../../common/widgets/unfocus_wrapper.dart';
import '../widgets/register_title_widget.dart';

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
  final _passwordController = TextEditingController();
  final nameFocusNode = FocusNode(debugLabel: 'nameFocusNode');
  final emailFocusNode = FocusNode(debugLabel: 'surnameFocusNode');
  var _obscureText = true;
  @override
  void dispose() {
    nameController.dispose();
    nameFocusNode.dispose();
    emailController.dispose();
    surnameController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: EmpathyColors.mainBackroundColor,
      body: UnfocusWrapper(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RegisterTitleWidget(),
            Form(
              key: formKey,
              child: SeparatedColumn(
                spacing: 10,
                children: [
                  TextInput(
                    label: 'Full name',
                    hint: 'Your full name',
                    controller: nameController,
                    color: Colors.black,
                    focusNode: nameFocusNode,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    textInputAction: TextInputAction.next,
                    validator: MandatoryValidator().validate,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autofillHints: const [AutofillHints.name],
                  ),
                  TextInput(
                    label: 'Email',
                    hint: 'Your email',
                    controller: surnameController,
                    color: Colors.black,
                    focusNode: emailFocusNode,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    textInputAction: TextInputAction.done,
                    validator: EmailValidator(
                      mandatory: true,
                      acceptLowerCase: true,
                    ).validate,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    autofillHints: const [AutofillHints.familyName],
                  ),
                  PasswordStrengthFormChecker(
                    minimumStrengthRequired: PasswordStrength.secure,
                    onChanged: (password, notifier) {
                      // Don't forget to update the notifier!
                      notifier.value =
                          PasswordStrength.calculate(text: password);
                    },
                    textFormFieldConfiguration: TextFormFieldConfiguration(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                    onPasswordGenerated: (password, notifier) {
                      debugPrint('$password - length: ${password.length}');
                      // Don't forget to update the notifier!
                      notifier.value =
                          PasswordStrength.calculate(text: password);
                    },
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
