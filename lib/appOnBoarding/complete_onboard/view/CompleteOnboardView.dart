import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';

class CompleteOnboardView extends StatefulWidget {
  const CompleteOnboardView({Key? key}) : super(key: key);

  @override
  State<CompleteOnboardView> createState() => _GifLoderState();
}

class _GifLoderState extends State<CompleteOnboardView>{

  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.appColor,
      body: SizedBox(
        height: Get.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
                top: 0,
                left: 0,
                right: 0,
                child: _buildGif()),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),
                  child: Text("Congratulations! ", style: CommonUi.customTextStyle(
                      fontFamily: Fonts.bold,color: ColorRes.white,fontSize: 30.0),),
                ),
                const SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: CommonUi.marginLeftRight),
                  child: Text("You just earned 20 points for completing onboarding. Create an account to claim your reward!",
                    textAlign: TextAlign.center,
                    style: CommonUi.customTextStyle(
                        fontFamily: Fonts.semiBold,color: ColorRes.white,fontSize: 18),),
                ),
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    socialLoginImage("google"),
                    socialLoginImage("facebook",isFacebook: true),
                    socialLoginImage("apple"),
                    InkWell(
                      onTap: (){
                        Get.toNamed(AppRoutes.signup);
                      },
                        child: socialLoginImage("email")
                    ),
                  ],
                ),


              ],
            ),
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

      child: Lottie.asset('assets/lottie/complete_lottie.json',height: Get.height,
        width: Get.width,
        alignment: Alignment.center
   ),
    );
  }
}
