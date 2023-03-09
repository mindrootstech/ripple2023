import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ripplefect/authentication/controller/AuthController.dart';
import 'package:ripplefect/helper/common_classes/CommonLoader.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';


class CompleteOnboardView extends StatelessWidget {
   CompleteOnboardView({Key? key}) : super(key: key);
   var controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    print('height of device ${Get.height}');
    return Scaffold(
      backgroundColor: ColorRes.appColor,
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Container(
              height: Get.height,
              width: Get.width,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(CommonUi.setPngImage('bg_onboarding')),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.only(top: 80,bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                 congratulationsPart(),

                  _buildTreeGif(),
                 socialLoginPart()
                ],
              ),
            ),

            Obx((){
              if(controller.loader.value){
                return const CommonLoader();
              }else{
                return const SizedBox();
              }
            })
          ],
        ),
      ),
    );
  }
  ClipOval socialLoginImage(String imageName,{bool isFacebook=false}) {
    return ClipOval(
      child: SizedBox.fromSize(
        size: const Size.fromRadius(27), // Image radius
        child: Container(
          padding: const EdgeInsets.all(12),
          color: isFacebook ? ColorRes.socialLoginFacebookColors:ColorRes.socialLoginColors,
          child: SvgPicture.asset(CommonUi.setSvgImage(imageName)),
        ),
      ),
    );
  }

  Widget _buildGif(){
    return Container(
      child: Lottie.asset(CommonUi.setLottie('complete_lottie'),height: Get.height,
          width: Get.width,
          alignment: Alignment.center
      ),
    );
  }
   Widget _buildTreeGif(){
     return Expanded(
       child: Container(
         margin: const EdgeInsets.symmetric(horizontal: 17,vertical: 60),
         child: Lottie.asset(CommonUi.setLottie('tree_lottie'),
             // width: Get.width,
             // height: Get.height,
             fit: BoxFit.contain,
             repeat: true,
             alignment: Alignment.center
         ),
       ),
     );
   }

 Widget congratulationsPart() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),
          child: Text("Congratulations! ", style: CommonUi.customTextStyle(
              fontFamily: Fonts.bold,color: ColorRes.white,fontSize: 30.0),),
        ),
        const SizedBox(height: 15,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),
          child: Text("You just earned 20 points for completing onboarding. ",
            textAlign: TextAlign.center,
            style: CommonUi.customTextStyle(
                fontFamily: Fonts.regular,color: ColorRes.white,fontSize: 18),),
        ),
      ],
    );
  }

 Widget socialLoginPart() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight,vertical: 30),
          child: Text("Create an account to claim your reward!",
            textAlign: TextAlign.center,
            style: CommonUi.customTextStyle(
                fontFamily: Fonts.regular,color: ColorRes.white,fontSize: 18),),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                  onTap: (){
                    controller.loginWithGoogle();
                  },
                  child: socialLoginImage("google")),

              InkWell(
                  onTap: (){
                    controller.loginWithFacebook();
                  },
                  child: socialLoginImage("facebook",isFacebook: true)),


              if(Platform.isIOS)...{
                InkWell(
                    onTap: (){
                      controller.applyAppleLogin();
                    }, child: socialLoginImage("apple")),
              },

              InkWell(
                  onTap: (){
                    Get.toNamed(AppRoutes.signup);
                  },
                  child: socialLoginImage("email")
              ),
            ],
          ),
        ),
      ],
    );
  }
}
