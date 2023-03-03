import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import '../../helper/common_classes/CommonLoader.dart';
import '../../helper/common_classes/InputValidationMixin.dart';
import '../../helper/routes/AppRoutes.dart';
import '../controller/AuthController.dart';

class SignupView extends StatelessWidget with InputValidationMixin {
  SignupView({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey <FormState>();
  var controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CommonUi.customLayout(
              title: Strings.createAccount,
              isBack: false,
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  resizeToAvoidBottomInset: true,
                  body: Form(
                    key: formGlobalKey,
                    child: CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          hasScrollBody: false,
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Strings.myName, style: CommonUi.customTextStyle(
                                    fontFamily: Fonts.semiBold, fontSize: 18),),
                                const SizedBox(height: 15,),
                                TextFormField(
                                  validator: (name) {
                                    if (isNameValid(name ?? '')) {
                                      return null;
                                    } else {
                                      return Strings.textYourName;
                                    }
                                  },
                                  controller: controller.rNameField,
                                  decoration: CommonUi.textFieldDecoration(
                                      hintText: Strings.fullName),
                                ),
                                const SizedBox(height: 25,),
                                Text(Strings.myEmail,
                                  style: CommonUi.customTextStyle(
                                      fontFamily: Fonts.semiBold, fontSize: 18),),
                                const SizedBox(height: 15,),
                                TextFormField(
                                  controller: controller.rEmailField,
                                  validator: (email) {
                                    if (isEmailValid(email ?? '')) {
                                      return null;
                                    } else {
                                      return Strings.textValidEmail;
                                    }
                                  },
                                  decoration: CommonUi.textFieldDecoration(
                                      hintText: Strings.emailAddress),
                                ),
                                const SizedBox(height: 50,),
                                Text(Strings.setUpPass,
                                  style: CommonUi.customTextStyle(
                                      fontFamily: Fonts.semiBold, fontSize: 18),),
                                const SizedBox(height: 15,),
                                Obx(() {
                                  return TextFormField(
                                    obscureText: !controller.passVisible.value,
                                    controller: controller.rPassField,
                                    validator: (password) {
                                      if (isPasswordValid(password ?? '')) {
                                        return null;
                                      } else {
                                        return Strings.textValidPassword;
                                      }
                                    },
                                    decoration: CommonUi.textFieldDecoration(
                                        hintText: Strings.createPass,
                                        isPass: true,
                                        passwordVisible: controller.passVisible),
                                  );
                                }),
                                const SizedBox(height: 10,),
                                Text(Strings.passMustContain,
                                  style: CommonUi.customTextStyle(
                                      fontFamily: Fonts.medium,
                                      fontSize: 12,
                                      color: ColorRes.greyColor),),
                                const Spacer(),
                                // const SizedBox(
                                //   height: 50,
                                // ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(Strings.acceptTerms,
                                      textAlign: TextAlign.center,
                                      style: CommonUi.customTextStyle(
                                          fontFamily: Fonts.medium,
                                          fontSize: 12,
                                          color: ColorRes.lightTextColor),),
                                    const SizedBox(height: 15,),
                                    CommonUi.customButton(
                                        fontSize: 18.0, callBack: () {
                                      FocusScope.of(context).unfocus();
                                      if (formGlobalKey.currentState!
                                          .validate()) {
                                        controller.registerApiImplementation(
                                            1, '');
                                      }
                                    }),
                                    const SizedBox(height: 15,),
                                    GestureDetector(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.login);
                                      },
                                      child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: Strings.alreadyAccount,
                                                  style: CommonUi
                                                      .customTextStyle(),
                                                ),
                                                TextSpan(
                                                  text: Strings.login,
                                                  style: CommonUi.customTextStyle(
                                                      color: ColorRes.buttonColor,
                                                      decoration:
                                                      TextDecoration.underline),
                                                ),
                                              ],
                                            ),
                                          )

                                      ),
                                    ),
                                    // GestureDetector(
                                    //   onTap: (){
                                    //     Get.toNamed(AppRoutes.login);
                                    //     controller.registerFieldsClear();
                                    //   },
                                    //   child: Text(Strings.doLater, style: CommonUi.customTextStyle(
                                    //       fontFamily: Fonts.bold,color: ColorRes.greyColor),),
                                    // ),
                                    const SizedBox(height: 20,),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
          ),
          Obx(() {
            return controller.loader.value ? CommonLoader() : SizedBox();
          })
        ],
      ),
    );
  }


}
