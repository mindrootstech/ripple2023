import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ripplefect/helper/common_classes/CommonLoader.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';

import '../controller/AuthController.dart';


class VerificationView extends StatelessWidget {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AuthController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              CommonUi.customLayout(
                title: Strings.enterCode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.enterCodeEmail,
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
                      child: Text("${Strings.resentAfter} 00:25",
                        style: CommonUi.customTextStyle(fontSize: FontSize.font14,
                            decoration: TextDecoration.underline,
                            fontFamily: Fonts.bold,
                            color: ColorRes.greyColor),),
                    ),
                    CommonUi.customButton(buttonText:Strings.continueTxt,fontSize:FontSize.font20,callBack: (){
                      controller.vcApiImplementation();


                    }),
                    const SizedBox(height: 50,),
                  ],
                ),

              ),
              if(controller.loader.value)...{
                const CommonLoader()
              }
            ],
          ),
        );
      },
    );
  }
}
