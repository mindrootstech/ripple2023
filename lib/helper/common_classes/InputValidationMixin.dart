import 'package:email_validator/email_validator.dart';

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 8;
  bool isConfirmPasswordValid(String password, String cPass) => password == cPass;
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
  bool isOtpValid(String otp) {
   if(otp.isNotEmpty&&otp.length>5){
     return true;
   }else{
     return false;
   }
  }
}