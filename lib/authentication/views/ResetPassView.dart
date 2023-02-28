import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ripplefect/authentication/controller/AuthController.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/constants/strings.dart';
import '../../helper/common_classes/CommonLoader.dart';
import '../../helper/common_classes/InputValidationMixin.dart';

class ResetPassView extends StatelessWidget with InputValidationMixin{
   ResetPassView({Key? key}) : super(key: key);
  final formGlobalKey = GlobalKey < FormState > ();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetX<AuthController>(
        builder: (controller) {
          return Stack(
            children: [
              CommonUi.customLayout(
                  title: Strings.resetPass,
                  child: Form(
                    key: formGlobalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.resetPassDesc,
                          style: CommonUi.customTextStyle(),),
                        const SizedBox(height: 30,),

                        Text(Strings.createPass, style: CommonUi.customTextStyle(
                            fontFamily: Fonts.semiBold, fontSize: 18),),
                        const SizedBox(height: 15,),
                        TextFormField(
                          validator: (pass) {
                            if (isPasswordValid(pass??'')) {
                              return null;
                            } else {
                              return Strings.textValidPassword;
                            }
                          },
                          controller: controller.resetPassField,
                          obscureText: !controller.currentVisible.value,
                          decoration: CommonUi.textFieldDecoration(hintText: Strings.enterPass,
                              isPass: true,passwordVisible: controller.currentVisible),
                        ),

                        const SizedBox(height: 25,),

                        Text(Strings.confirmPass, style: CommonUi.customTextStyle(
                            fontFamily: Fonts.semiBold, fontSize: 18),),
                        const SizedBox(height: 15,),
                        TextFormField(
                          validator: (pass) {
                            if (isConfirmPasswordValid(pass??'',controller.resetPassField.text)&&isPasswordValid(pass??'')) {
                              return null;
                            } else {
                              return Strings.textValidPassword;
                            }
                          },
                          controller: controller.confirmPassField,
                          obscureText: !controller.confirmVisible.value,
                          decoration: CommonUi.textFieldDecoration(hintText: Strings.confirmPass,
                              isPass: true,passwordVisible: controller.confirmVisible),
                        ),

                        const Spacer(),
                        CommonUi.customButton(buttonText:Strings.continueTxt,fontSize:18.0,callBack: (){
                          FocusScope.of(context).unfocus();
                          if (formGlobalKey.currentState!.validate()) {
                            controller.resetPassApiImplementation();
                          }

                        }),
                        const SizedBox(height: 50,),
                      ],
                    ),
                  )
              ),
              if(controller.loader.value)...{
                const CommonLoader()
              }
            ],
          );
        },
      ),
    );
  }
}
