
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ripplefect/api_provider/ApiProvider.dart';
import 'package:ripplefect/helper/common_classes/LocalStorage.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';
import '../../../helper/constants/CommonUi.dart';
import '../model/AuthModel.dart';

class AuthController extends GetxController{
  var apiProvider=ApiProvider();
  var localStorage=LocalStorage();
  var loader=false.obs;


  ///Register controllers.......
  var rNameField = TextEditingController();
  var rEmailField = TextEditingController();
  var rPassField = TextEditingController();


  /// Login controllers....
  var emailField = TextEditingController();
  var passField = TextEditingController();
  var passVisible = false.obs;


  ///Forgot password controllers....
  var fpEmailField = TextEditingController();


  /// verification code controllers...
  var pinController = TextEditingController();


  /// Reset pass controllers.....
  var currentVisible = false.obs;
  var confirmVisible = false.obs;
  var resetPassField = TextEditingController();
  var confirmPassField = TextEditingController();






  void registerFieldsClear(){
    rNameField.text='';
    rEmailField.text='';
    rPassField.text='';
  }

  void loginFieldsClear() {
    emailField.text='';
    passField.text='';
  }
  void fpFieldsClear(){
    fpEmailField.text='';
    pinController.text='';
  }
  void vcFieldsClear(){
      resetPassField.text ='';
      confirmPassField.text='';
    }



    //register user Api
  void  registerApiImplementation(int registerType,String socialToken) async {
    var userEmail=rEmailField.text.trim();
    final bool validEmail = EmailValidator.validate(userEmail);
    if(rNameField.text.isEmpty){
      CommonUi.showToast(Strings.textNameIsRequired);
      return;
    }else if(rEmailField.text.isEmpty){
      CommonUi.showToast(Strings.textEmailIsRequired);
      return;
    }else if(validEmail==false){
      CommonUi.showToast(Strings.textPleaseEnterValidEmail);
      return;
    }else if(rPassField.text.isEmpty){
      CommonUi.showToast(Strings.textPasswordIsRequired);
      return;
    }else if(rPassField.text.length<6){
      CommonUi.showToast(Strings.textPasswordLength);
      return;
    }
    loader.value=true;
    await apiProvider.registerApi(rNameField.text,userEmail, rPassField.text,registerType,socialToken).then((value){
      if(value=='error'){
        loader.value=false;
        return;
      }
      else{
        var response = authModelFromJson(value);
        if(response.status) {
          localStorage.saveAuthCode(response.data.token??'');
          CommonUi.showToast(response.message);
          Get.offAllNamed(AppRoutes.dashboard);
          registerFieldsClear();
        }else{
          CommonUi.showToast(response.message);
        }
        loader.value=false;
      }
    }).catchError((e){
      loader.value=false;
    });
  }

  //login User Api
  void  loginApiImplementation(int loginType,String socialToken) async {
    var userEmail=emailField.text.trim();
    final bool validEmail = EmailValidator.validate(userEmail);
    if(emailField.text.isEmpty){
      CommonUi.showToast(Strings.textEmailIsRequired);
      return;
    }else if(validEmail==false){
      CommonUi.showToast(Strings.textPleaseEnterValidEmail);
      return;
    }else if(passField.text.isEmpty){
      CommonUi.showToast(Strings.textPasswordIsRequired);
      return;
    }
    loader.value=true;
    await apiProvider.loginApi(userEmail, passField.text,loginType,socialToken).then((value){
      if(value=='error'){
        loader.value=false;
        return;
      }
      else{
        var response = authModelFromJson(value);
        if(response.status) {
          localStorage.saveAuthCode(response.data.token??'');
          CommonUi.showToast(response.message);
          Get.offAllNamed(AppRoutes.dashboard);
          loginFieldsClear();
        }else{
            CommonUi.showToast(response.message);
        }
        loader.value=false;
      }
    }).catchError((e){
      loader.value=false;
    });
  }

  //Forgot password api
  void  fpApiImplementation() async {
    var userEmail=emailField.text.trim();
    final bool validEmail = EmailValidator.validate(userEmail);
    if(emailField.text.isEmpty){
      CommonUi.showToast(Strings.textEmailIsRequired);
      return;
    }else if(validEmail==false){
      CommonUi.showToast(Strings.textPleaseEnterValidEmail);
      return;
    }
    loader.value=true;
    await apiProvider.forgotPassApi(userEmail).then((value){
      if(value=='error'){
        loader.value=false;
        return;
      }
      else{
        var response = authModelFromJson(value);
        if(response.status) {
          CommonUi.showToast(response.message);
          Get.toNamed(AppRoutes.verification);
        }else{
          CommonUi.showToast(response.message);
        }
        loader.value=false;
      }
    }).catchError((e){
      loader.value=false;
    });
  }

  //verification code api
  void  vcApiImplementation() async {
    var userEmail=emailField.text.trim();
    if(pinController.text.isEmpty){
      CommonUi.showToast(Strings.textVerificationCodeIsRequired);
      return;
    }
    loader.value=true;
    await apiProvider.verifyCodeApi(userEmail,pinController.text).then((value){
      if(value=='error'){
        loader.value=false;
        return;
      }
      else{
        var response = authModelFromJson(value);
        if(response.status) {
          CommonUi.showToast(response.message);
          Get.toNamed(AppRoutes.resetPass);
          fpFieldsClear();
        }else{
          CommonUi.showToast(response.message);
        }
        loader.value=false;
      }
    }).catchError((e){
      loader.value=false;
    });
  }

  //reset password api
  void  resetPassApiImplementation() async {
    var pass=resetPassField.text.trim();
    var cPass=confirmPassField.text.trim();
    if(pass.isEmpty){
      CommonUi.showToast(Strings.textPasswordIsRequired);
      return;
    }else if(cPass.isEmpty){
      CommonUi.showToast(Strings.textCPasswordIsRequired);
      return;
    }else if(pass!=cPass){
      CommonUi.showToast(Strings.textNotMatching);
      return;
    }
    loader.value=true;
    await apiProvider.resetPassApi(pass,cPass).then((value){
      if(value=='error'){
        loader.value=false;
        return;
      }
      else{
        var response = authModelFromJson(value);
        if(response.status) {
          CommonUi.showToast(response.message);
          Get.offAllNamed(AppRoutes.login);
          vcFieldsClear();
        }else{
          CommonUi.showToast(response.message);
        }
        loader.value=false;
      }
    }).catchError((e){
      loader.value=false;
    });
  }


}