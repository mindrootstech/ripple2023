import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';
import '../controller/ResetPassController.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetX<ResetPassController>(
        builder: (controller) {
          return customLayout(
              title: "Reset Password",
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Enter your email address below. We will send you a 6 digit code to verify your account.",
                    style: CommonUi.customTextStyle(),),
                  const SizedBox(height: 30,),

                  Text("Create Password", style: CommonUi.customTextStyle(
                      fontFamily: Fonts.semiBold, fontSize: FontSize.font20),),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: controller.currentField,
                    obscureText: !controller.currentVisible.value,
                    decoration: CommonUi.textFieldDecoration(hintText: "Enter Password",
                        isPass: true,passwordVisible: controller.currentVisible),
                  ),

                  const SizedBox(height: 25,),

                  Text("Confirm Password", style: CommonUi.customTextStyle(
                      fontFamily: Fonts.semiBold, fontSize: FontSize.font20),),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: controller.confirmField,
                    obscureText: !controller.confirmVisible.value,
                    decoration: CommonUi.textFieldDecoration(hintText: "Confirm Password",
                        isPass: true,passwordVisible: controller.confirmVisible),
                  ),

                  const Spacer(),
                  CommonUi.customButton(buttonText:"Continue",fontSize:FontSize.font20,callBack: (){
                    Get.offAllNamed(AppRoutes.login);

                  }),
                  const SizedBox(height: 50,),
                ],
              )
          );
        },
      ),
    );
  }
}
