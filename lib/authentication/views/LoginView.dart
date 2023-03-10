import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/common_classes/CommonLoader.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';
import '../../helper/common_classes/InputValidationMixin.dart';
import '../controller/AuthController.dart';

class LoginView extends StatelessWidget with InputValidationMixin{
   LoginView({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey < FormState > ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: GetX<AuthController>(builder: (controller) {
        return Stack(
          children: [
            CommonUi.customLayout(
                title: Strings.login,
                onBack: (){
                  Get.offAllNamed(AppRoutes.signup);
                },
                child:  Form(
                  key: formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.myEmail,
                        style: CommonUi.customTextStyle(
                            fontFamily: Fonts.semiBold, fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (email) {
                          if (isEmailValid(email??'')) {
                            return null;
                          } else {
                            return Strings.textValidEmail;
                          }
                        },
                        controller: controller.emailField,
                        decoration: CommonUi.textFieldDecoration(
                            hintText: Strings.enterEmail),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        Strings.myPass,
                        style: CommonUi.customTextStyle(
                            fontFamily: Fonts.semiBold, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.passField,
                        validator: (password) {
                          if (isPasswordValid(password??'')) {
                            return null;
                          } else {
                            return Strings.textValidPassword;
                          }
                        },
                        obscureText: !controller.passVisible.value,
                        decoration: CommonUi.textFieldDecoration(
                            hintText: Strings.enterPass,
                            isPass: true,
                            passwordVisible: controller.passVisible),
                      ),

                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.forgotPass);
                        },
                        child: Container(
                          padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                          alignment: Alignment.centerRight,
                          child: Text(
                            Strings.forgotMyPass,
                            style: CommonUi.customTextStyle(
                                fontFamily: Fonts.medium,
                                fontSize: 12,
                                color: ColorRes.greyColor),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonUi.customButton(
                              buttonText: Strings.login,
                              fontSize: 18.0,
                              callBack: () {
                                FocusScope.of(context).unfocus();
                                if (formGlobalKey.currentState!.validate()) {
                                  controller.loginApiImplementation(1, '');
                                }

                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            Strings.or,
                            style: CommonUi.customTextStyle(
                                fontFamily: Fonts.semiBold, color: ColorRes.greyColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            Strings.loginUsing,
                            style: CommonUi.customTextStyle(
                                fontFamily: Fonts.semiBold, color: ColorRes.greyColor),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Wrap(
                            spacing: 17,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    controller.loginWithGoogle();
                                  },
                                  child: socialLoginImage("google")),

                              GestureDetector(
                                  onTap: (){
                                    controller.loginWithFacebook();
                                  },
                                  child: socialLoginImage("facebook",isFacebook: true)),


                              if(Platform.isIOS)...{
                                GestureDetector(
                                    onTap: (){
                                      controller.applyAppleLogin();
                                    }, child: socialLoginImage("apple")),
                              },

                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            if(controller.loader.value)...{
              const CommonLoader()
            }
          ],
        );
      }),
    );
  }

  ClipOval socialLoginImage(String imageName, {bool isFacebook = false}) {
    return ClipOval(
      child: SizedBox.fromSize(
        size: const Size.fromRadius(20), // Image radius
        child: Container(
          padding: const EdgeInsets.all(10),
          color: isFacebook
              ? ColorRes.socialLoginFacebookColors
              : ColorRes.socialLoginColors,
          child: SvgPicture.asset(CommonUi.setSvgImage(imageName)),
        ),
      ),
    );
  }
}
