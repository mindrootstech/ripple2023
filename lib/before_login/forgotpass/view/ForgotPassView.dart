import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/before_login/forgotpass/controller/ForgotPassController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/routes/app_pages.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = ForgotPassController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CustomLayout(
          title: "Forgot Password",
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enter your email address below. We will send you a 6 digit code to verify your account.",
                style: CommonUi.customTextStyle(),),
              const SizedBox(height: 30,),
              Text("My Email", style: CommonUi.customTextStyle(
                  fontFamily: Fonts.semiBold, fontSize: FontSize.font20),),
              const SizedBox(height: 15,),
              TextFormField(
                controller: controller.emailField,
                decoration: CommonUi.textFieldDecoration(hintText: "xyzabc@gmail.com"),
              ),
              const SizedBox(height: 25,),

              const Spacer(),
              CommonUi.customButton(buttonText:"Continue",fontSize:FontSize.font20,callBack: (){
                Get.toNamed(AppRoutes.verification);

              }),
              const SizedBox(height: 50,),
            ],
          )
      ),
    );
  }
}
