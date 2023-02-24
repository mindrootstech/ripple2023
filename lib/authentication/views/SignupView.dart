import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import '../../helper/common_classes/CommonLoader.dart';
import '../../helper/routes/AppRoutes.dart';
import '../controller/AuthController.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetX<AuthController>(builder: (controller) {
        return Stack(
          children: [
            CommonUi.customLayout(
                title: Strings.createAccount,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.myName, style: CommonUi.customTextStyle(
                        fontFamily: Fonts.semiBold, fontSize: FontSize.font20),),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: controller.rNameField,
                      decoration: CommonUi.textFieldDecoration(hintText: Strings.fullName),
                    ),
                    const SizedBox(height: 25,),
                    Text(Strings.myEmail, style: CommonUi.customTextStyle(
                        fontFamily: Fonts.semiBold, fontSize: FontSize.font20),),
                    const SizedBox(height: 15,),
                    TextFormField(
                      controller: controller.rEmailField,
                      decoration: CommonUi.textFieldDecoration(hintText: Strings.emailAddress),
                    ),
                    const SizedBox(height: 50,),
                    Text(Strings.setUpPass, style: CommonUi.customTextStyle(
                        fontFamily: Fonts.semiBold, fontSize: FontSize.font20),),
                    const SizedBox(height: 15,),
                    TextFormField(
                      obscureText: !controller.passVisible.value,
                      controller: controller.rPassField,
                      decoration: CommonUi.textFieldDecoration(hintText: Strings.createPass,
                          isPass: true,passwordVisible: controller.passVisible),
                    ),
                    const SizedBox(height: 10,),
                    Text(Strings.passMustContain, style: CommonUi.customTextStyle(
                        fontFamily: Fonts.medium, fontSize: FontSize.font12,color: ColorRes.greyColor),),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Strings.acceptTerms,textAlign: TextAlign.center,
                          style: CommonUi.customTextStyle(
                              fontFamily: Fonts.medium, fontSize: FontSize.font12,color: ColorRes.lightTextColor),),
                        const SizedBox(height: 15,),
                        CommonUi.customButton(fontSize:FontSize.font20,callBack: (){
                          controller.registerApiImplementation(1,'');
                        }),
                        const SizedBox(height: 15,),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.login);
                            controller.registerFieldsClear();
                          },
                          child: Text(Strings.doLater, style: CommonUi.customTextStyle(
                              fontFamily: Fonts.bold,color: ColorRes.greyColor),),
                        ),
                        const SizedBox(height: 20,),
                      ],
                    ),
                  ],
                )
            ),
            if(controller.loader.value)...{
              const CommonLoader(),
            }
          ],
        );
      }),
    );
  }

}
