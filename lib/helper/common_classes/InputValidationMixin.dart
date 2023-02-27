import 'package:email_validator/email_validator.dart';

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 8;
  bool isNameValid(String name) {
    if(name.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }

  bool isEmailValid(String email) {
    final bool validEmail = EmailValidator.validate(email);
    return validEmail;
  }
}