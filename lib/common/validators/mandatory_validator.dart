import 'package:empathyapp/common/validators/validator.dart';

class MandatoryValidator extends InputValidator {
  @override
  String? validate(String? input) {
    if (input?.trim().isEmpty ?? true) {
      return 'mandatory';
    } else {
      return null;
    }
  }
}
