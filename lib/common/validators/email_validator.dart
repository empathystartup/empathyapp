import 'package:empathyapp/common/validators/validator.dart';

class EmailValidator extends InputValidator {
  final bool mandatory;
  final bool acceptLowerCase;

  EmailValidator({this.mandatory = true, this.acceptLowerCase = false});
  @override
  String? validate(String? input) {
    if (!mandatory && input!.isEmpty) {
      return null;
    }
    const pattern =
        r'^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$';
    final regExp = RegExp(pattern);

    final normalizedInput = acceptLowerCase ? input?.toLowerCase() : input;
    final String thisString = normalizedInput!;
    if (!regExp.hasMatch(thisString)) {
      return 'invalid_mail';
    }
    return null;
  }
}
