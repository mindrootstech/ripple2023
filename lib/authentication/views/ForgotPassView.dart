import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import '../../helper/common_classes/CommonLoader.dart';
import '../../helper/common_classes/InputValidationMixin.dart';
import '../controller/AuthController.dart';

class ForgotPassView extends StatelessWidget with InputValidationMixin {
   ForgotPassView({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey < FormState > ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: GetX<AuthController>(builder: (controller) {
          return Stack(
            children: [
              CommonUi.customLayout(
                  title: Strings.forgotPass,

                  child: Form(
                    key: formGlobalKey,
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
                              fontSize: 18),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator: (email) {
                            if (isEmailValid(email??'')) {
                              return null;
                            } else {
                              return Strings.textValidEmail;
                            }
                          },
                          style: CommonUi.customTextStyle(),
                          controller: controller.fpEmailField,
                          decoration: CommonUi.textFieldDecoration(
                              hintText: "xyzabc@gmail.com"),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const Spacer(),
                        CommonUi.customButton(
                            buttonText: Strings.continueTxt,
                            fontSize: 18.0,
                            callBack: () {
                              FocusScope.of(context).unfocus();
                              if (formGlobalKey.currentState!.validate()) {
                                controller.fpApiImplementation(false);
                              }

                            }),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  )),
              if (controller.loader.value) ...{
                const CommonLoader()}
            ],
          );
        }));
  }
}
