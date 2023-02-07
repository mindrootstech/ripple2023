import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';

import '../controller/VerificationController.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<VerificationController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: customLayout(
              title: "Enter Code",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter the code that you have received in your email.",
                    style: CommonUi.customTextStyle(),),
                  const SizedBox(height: 30,),
                  PinCodeTextField(
                    hintCharacter: "0",
                    hintStyle: CommonUi.customTextStyle(color: ColorRes.ultralightTextColor),
                    textStyle: CommonUi.customTextStyle(color: ColorRes.greyColor),
                    cursorColor: ColorRes.ultralightTextColor,
                    length: 6,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      inactiveColor: ColorRes.ultralightTextColor,
                      selectedColor: ColorRes.ultralightTextColor,
                      borderWidth: 1,
                      disabledColor: Colors.brown,
                      errorBorderColor: Colors.green,
                      inactiveFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,

                      activeFillColor: Colors.white,
                      activeColor: ColorRes.lightTextColor
                    ),
                    animationDuration: const Duration(milliseconds: 200),
                    backgroundColor: Colors.transparent ,
                    enableActiveFill: true,
                    controller: controller.pinController,
                    onCompleted: (v) {
                    },
                    onChanged: (value) {
                    },
                    beforeTextPaste: (text) {
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(bottom: 50),
                    child: Text("Resend passcode after 00:25",
                      style: CommonUi.customTextStyle(fontSize: FontSize.font16,
                          decoration: TextDecoration.underline,
                      fontFamily: Fonts.bold,
                      color: ColorRes.greyColor),),
                  ),
                  CommonUi.customButton(buttonText:"Continue",fontSize:FontSize.font20,callBack: (){
                    Get.toNamed(AppRoutes.resetPass);

                  }),
                  const SizedBox(height: 50,),
                ],
              )
          ),
        );
      },
    );
  }
}