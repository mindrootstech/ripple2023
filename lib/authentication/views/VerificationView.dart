import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ripplefect/helper/common_classes/CommonLoader.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';

import '../../helper/common_classes/InputValidationMixin.dart';
import '../controller/AuthController.dart';


class VerificationView extends StatelessWidget with InputValidationMixin{
   VerificationView({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey < FormState > ();

  @override
  Widget build(BuildContext context) {
    Get.find<AuthController>().pinController = TextEditingController();
    Get.find<AuthController>().getOtpRemainingTime();
    return GetX<AuthController>(
      builder: (controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              CommonUi.customLayout(
                title: Strings.enterCode,
                onBack: (){
                  controller.timer.cancel();
                  Get.back();
                },
                child: Form(
                  key: formGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.enterCodeEmail,
                        style: CommonUi.customTextStyle(),),
                      const SizedBox(height: 30,),
                      PinCodeTextField(
                        hintCharacter: "0",
                        errorTextMargin: const EdgeInsets.only(top: 7),
                        validator: (otp) {
                          if (isOtpValid(otp??'')) {
                            return null;
                          }
                          else {
                            return Strings.textValidOtp;
                          }
                        },
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
                            errorBorderColor: ColorRes.colorRed,
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
                          return true;
                        },
                        appContext: context,
                      ),
                      const Spacer(),

                      if(controller.counter.value>0)...{
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(bottom: 50),
                          child: Text("${Strings.resentAfter} ${controller.counter.value}",
                            style: CommonUi.customTextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: Fonts.semiBold,
                                color: ColorRes.greyColor),),
                        ),
                      }
                      else...{
                        GestureDetector(
                          onTap: (){
                            controller.fpApiImplementation(true);

                          },
                          child:  Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(bottom: 50),
                            child: Text(Strings.resentCode,
                              style: CommonUi.customTextStyle(fontSize: 14.0,
                                  decoration: TextDecoration.underline,
                                  fontFamily: Fonts.bold,
                                  color: ColorRes.greyColor),),
                          ),
                        ),

                      },

                      CommonUi.customButton(buttonText:Strings.continueTxt,fontSize:18.0,callBack: (){
                        FocusScope.of(context).unfocus();
                        if (formGlobalKey.currentState!.validate()) {
                          if(controller.counter.value>0){
                            controller.vcApiImplementation();
                          }else{
                            CommonUi.showToast('Please resend otp');
                          }
                        }





                      }),
                      const SizedBox(height: 50,),
                    ],
                  ),
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
