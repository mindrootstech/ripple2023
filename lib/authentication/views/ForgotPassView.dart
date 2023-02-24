import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import '../../helper/common_classes/CommonLoader.dart';
import '../controller/AuthController.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetX<AuthController>(builder: (controller) {
          return Stack(
            children: [
              CommonUi.customLayout(
                  title: Strings.forgotPass,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Strings.enterYourEmail,
                        style: CommonUi.customTextStyle(),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        Strings.myEmail,
                        style: CommonUi.customTextStyle(
                            fontFamily: Fonts.semiBold,
                            fontSize: FontSize.font20),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: controller.emailField,
                        decoration: CommonUi.textFieldDecoration(
                            hintText: "xyzabc@gmail.com"),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Spacer(),
                      CommonUi.customButton(
                          buttonText: Strings.continueTxt,
                          fontSize: FontSize.font20,
                          callBack: () {
                            controller.fpApiImplementation();
                          }),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  )),
              if (controller.loader.value) ...{
                const CommonLoader()}
            ],
          );
        }));
  }
}
