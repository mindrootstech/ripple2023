import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:ripplefect/before_login/signup/controller/SignupController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/colors.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/routes/app_pages.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetX<SignupController>(builder: (controller) {
        return CustomLayout(
            title: "Create account",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("My  Name", style: CommonUi.customTextStyle(
                    fontFamily: Fonts.semiBold, fontSize: FontSize.font20),),
                const SizedBox(height: 15,),
                TextFormField(
                  decoration: CommonUi.textFieldDecoration(hintText: "Full Name"),
                ),
                const SizedBox(height: 25,),
                Text("My Email", style: CommonUi.customTextStyle(
                    fontFamily: Fonts.semiBold, fontSize: FontSize.font20),),
                const SizedBox(height: 15,),
                TextFormField(
                  decoration: CommonUi.textFieldDecoration(hintText: "Email Address"),
                ),
                const SizedBox(height: 50,),
                Text("Setup my password", style: CommonUi.customTextStyle(
                    fontFamily: Fonts.semiBold, fontSize: FontSize.font20),),
                const SizedBox(height: 15,),
                TextFormField(
                  obscureText: !controller.passVisible.value,
                  decoration: CommonUi.textFieldDecoration(hintText: "Create Password",
                      isPass: true,passwordVisible: controller.passVisible),
                ),
                const SizedBox(height: 10,),
                Text("Password must contain atleast 8 characters", style: CommonUi.customTextStyle(
                    fontFamily: Fonts.medium, fontSize: FontSize.font12,color: MyColors.greyColor),),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("By continuing you accept our Terms of Service and Privacy Policy.",textAlign: TextAlign.center,
                      style: CommonUi.customTextStyle(
                        fontFamily: Fonts.medium, fontSize: FontSize.font12,color: MyColors.lightTextColor),),
                    const SizedBox(height: 15,),
                    CommonUi.customButton(fontSize:FontSize.font20,callBack: (){

                    }),
                    const SizedBox(height: 15,),
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.login);
                      },
                      child: Text("Do it later", style: CommonUi.customTextStyle(
                          fontFamily: Fonts.bold,color: MyColors.greyColor),),
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ],
            )
        );
      }),
    );
  }

}
