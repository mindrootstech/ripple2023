import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ripplefect/before_login/verification/controller/VerificationController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/colors.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/routes/app_pages.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<VerificationController>(
      builder: (controller) {
        print(controller.passVisible.value);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: CustomLayout(
              title: "Enter Code",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter the code that you have received in your email.",
                    style: CommonUi.customTextStyle(),),
                  const SizedBox(height: 30,),
                  PinCodeTextField(
                    hintCharacter: "0",
                    hintStyle: CommonUi.customTextStyle(color: MyColors.ultralightTextColor),
                    textStyle: CommonUi.customTextStyle(color: MyColors.greyColor),
                    cursorColor: MyColors.ultralightTextColor,
                    length: 6,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      inactiveColor: MyColors.ultralightTextColor,
                      selectedColor: MyColors.ultralightTextColor,
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
                      activeColor: MyColors.lightTextColor
                    ),
                    animationDuration: Duration(milliseconds: 200),
                    backgroundColor: Colors.transparent ,
                    enableActiveFill: true,
                    controller: controller.pinController,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                    appContext: context,
                  ),
                  const Spacer(),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 50),
                    child: Text("Resend passcode after 00:25",
                      style: CommonUi.customTextStyle(fontSize: FontSize.font16,
                          decoration: TextDecoration.underline,
                      fontFamily: Fonts.bold,
                      color: MyColors.greyColor),),
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
