import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:ripplefect/before_login/login/controller/LoginController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/colors.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/routes/app_pages.dart';
class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetX<LoginController>(builder: (controller) {
        return CustomLayout(
            title: "Log In",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("My Email", style: CommonUi.customTextStyle(
                    fontFamily: Fonts.semiBold, fontSize: FontSize.font20),),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: controller.emailField,
                  decoration: CommonUi.textFieldDecoration(hintText: "Enter Email"),
                ),
                const SizedBox(height: 25,),
                Text("My Password", style: CommonUi.customTextStyle(
                    fontFamily: Fonts.semiBold, fontSize: FontSize.font20),),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: controller.passField,
                  obscureText: !controller.passVisible.value,
                  decoration: CommonUi.textFieldDecoration(hintText: "Enter Password",
                      isPass: true,passwordVisible: controller.passVisible),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.forgotPass);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                    alignment: Alignment.centerRight,
                    child: Text("Forgot my password?", style: CommonUi.customTextStyle(
                        fontFamily: Fonts.medium, fontSize: FontSize.font12,color: MyColors.greyColor),),
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonUi.customButton(buttonText:"Login",fontSize:FontSize.font20,callBack: (){
                      Get.toNamed(AppRoutes.home);

                    }),
                    const SizedBox(height: 20,),
                    Text("OR", style: CommonUi.customTextStyle(
                        fontFamily: Fonts.bold,color: MyColors.greyColor),),
                    const SizedBox(height: 20,),
                    Text("Login using", style: CommonUi.customTextStyle(
                        fontFamily: Fonts.bold,color: MyColors.greyColor),),
                    const SizedBox(height: 5,),
                    Wrap(
                      spacing: 12,
                        children: [
                        socialLoginImage("google"),
                        socialLoginImage("facebook",isFacebook: true),
                        socialLoginImage("apple"),
                      ],
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

  ClipOval socialLoginImage(String imageName,{bool isFacebook=false}) {
    return ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(20), // Image radius
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            color: isFacebook ? MyColors.socialLoginFacebookColors:MyColors.socialLoginColors,
                            child: SvgPicture.asset(CommonUi.setSvgImage(imageName)),
                          ),
                        ),
                      );
  }
}
