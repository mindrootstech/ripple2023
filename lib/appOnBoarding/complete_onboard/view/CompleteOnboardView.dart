import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ripplefect/helper/constants/CommonUi.dart';
import 'package:ripplefect/helper/constants/ColorRes.dart';
import 'package:ripplefect/helper/constants/fonts.dart';
import 'package:ripplefect/helper/routes/AppRoutes.dart';

class CompleteOnboardView extends StatefulWidget {
  const CompleteOnboardView({Key? key}) : super(key: key);

  @override
  State<CompleteOnboardView> createState() => _GifLoderState();
}

class _GifLoderState extends State<CompleteOnboardView> with SingleTickerProviderStateMixin{

  late FlutterGifController _animationCtrl;
  @override
  void initState() {
    super.initState();
    _animationCtrl = FlutterGifController(vsync: this,duration: const Duration(seconds:1));
    _animationCtrl.repeat(min:0, max:100, period:const Duration(seconds:4));
  }
  @override
  void dispose() {
    _animationCtrl.dispose();
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
                Text("Congratulations! ", style: CommonUi.customTextStyle(
                    fontFamily: Fonts.bold,color: ColorRes.white,fontSize: FontSize.font32),),
                const SizedBox(height: 15,),
                Text("You just earned 20 points for completing onboarding. Create an account to claim your reward!",
                  textAlign: TextAlign.center,
                  style: CommonUi.customTextStyle(
                      fontFamily: Fonts.bold,color: ColorRes.white,fontSize: FontSize.font20),),
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
    return GifImage(
      height: Get.height,
      fit: BoxFit.cover,
      image: const AssetImage("assets/images/mygif.gif"),
      controller: _animationCtrl,
    );
  }
}
