
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:ripplefect/api_provider/ApiProvider.dart';
import 'package:ripplefect/helper/common_classes/LocalStorage.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';
import 'package:ripplefect/helper/service/GlobalService.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../../helper/constants/CommonUi.dart';
import '../model/AuthModel.dart';

class AuthController extends GetxController{
  var apiProvider=ApiProvider();
  var localStorage=LocalStorage();
  var loader=false.obs;
  var service=Get.find<GlobalServices>();





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
  late Timer timer;
  var counter = 25.obs;


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
    var selectedMore=<String>[];
    for(int i=0;i<service.selectedMore.length;i++){
      if(service.selectedMore[i].isSelected.value){
        selectedMore.add(service.selectedMore[i].id.toString());
      }
    }
    var userEmail=rEmailField.text.trim();
    loader.value=true;
    await apiProvider.registerApi(rNameField.text,userEmail, rPassField.text,registerType,socialToken,service.selectedWhy,selectedMore,service.selectedGoal).then((value){
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


  //Social Login
  void  socialLoginApiImplementation(String name,String email,int loginType,String socialToken,String profileImage) async {
    var selectedMore=<String>[];
    for(int i=0;i<service.selectedMore.length;i++){
      if(service.selectedMore[i].isSelected.value){
        selectedMore.add(service.selectedMore[i].id.toString());
      }
    }
    loader.value=true;
    await apiProvider.socialLoginApi(name,email,loginType,socialToken,service.selectedWhy,selectedMore,service.selectedGoal,profileImage).then((value){
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
  void  fpApiImplementation(bool timer) async {
    var userEmail=fpEmailField.text.trim();
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
          if(timer){
            getOtpRemainingTime();
          }
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
    var userEmail=fpEmailField.text.trim();
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
    var userEmail=fpEmailField.text.trim();
    var pass=resetPassField.text.trim();
    var cPass=confirmPassField.text.trim();
    loader.value=true;
    await apiProvider.resetPassApi(userEmail,pass).then((value){
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



 void getOtpRemainingTime(){
   counter.value = 25;
    timer= Timer.periodic(const Duration(seconds: 1), (timer) {
      counter.value--;
      print('the count is ${counter.value}');
      if (counter.value == 0) {
        timer.cancel();
      }
    });
  }




  ///Social integrations................................


  // login with facebook
  Future<void> loginWithFacebook() async {
    var facebookLoginResult;
    try {
      FacebookAuth.instance.logOut();
    } catch (e) {
      print(e);
    }
    try{
      facebookLoginResult = await FacebookAuth.instance.login(permissions: ['public_profile']);
    }catch(e){
      print(e);
    }
    switch (facebookLoginResult.status.toString()) {
      case 'LoginStatus.error':
        print("Error");

        break;
      case 'LoginStatus.cancelled':
        print("CancelledByUser");

        break;
      case 'LoginStatus.success':
        print("LoggedIn");

        var graphResponse = await Client().get(Uri.parse(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult.accessToken!.token}'));
      var  facebookProfile = json.decode(graphResponse.body);
        loader.value = true;
        Map<String, dynamic> map = {
          'name': facebookProfile['name'],
          'email':
          facebookProfile['email'] ?? "",
          'profile_pic':
          "https://graph.facebook.com/${facebookProfile['id']}/picture?type=large&redirect=true&width=600&height=600",
          'login_token': facebookProfile['id'],
          'login_type': "2",
          'apple_token': "",
        };
       var socialName = facebookProfile['name'];
       var socialEmail = facebookProfile['email'];
       var socialId = facebookProfile['id'];
       var profileImage=map['profile_pic'];
       if(facebookLoginResult.accessToken!=null){
         socialLoginApiImplementation(socialName,socialEmail,2,facebookLoginResult.accessToken!.token,profileImage);
       }else{
         loader.value = false;
       }
        break;
    }
  }

  // login with google
  Future<void> loginWithGoogle() async {
    // facebookOrGoogle = "2";
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      await _googleSignIn.signOut();
    } catch (e) {
      print(e);
    }

    try {
      var data = await _googleSignIn.signIn();
      if(data!=null){
        socialLoginApiImplementation(data.displayName??'',data.email??'',3,data.id??'',data.photoUrl??'');
      }

    } catch (error) {
      var er = error;
    }
  }

  //login with apple
  Future<void> applyAppleLogin() async {
    final result = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],);
    socialLoginApiImplementation(result.givenName??'',result.email??'',4,result.userIdentifier??'','');

    try {
      print("e");
    }catch(e){
      loader.value = false;
      print(e);
    }

  }





}